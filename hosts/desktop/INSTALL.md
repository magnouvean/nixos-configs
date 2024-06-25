# Installation

## Partitioning

I recommend using `gdisk` for paritioning

- 1M BIOS boot parition (`ef02`) at /dev/sda1
- 512M boot parition (`8300`) at /dev/sda2
- Rest of the space (`8300`) at /dev/sda3

## Installation

### Preparation

After formatting as described above run the following commands (as root and with internet):
```{bash}
sudo cryptsetup luksFormat /dev/sda3
sudo cryptsetup luksOpen /dev/sda3 enc-pv
sudo cryptsetup luksUUID /dev/sda3 --uuid "b17f7d5a-6e7d-4357-8f30-4d5a98a39d62"
```

```{bash}
sudo pvcreate /dev/mapper/enc-pv
sudo vgcreate vg /dev/mapper/enc-pv
sudo lvcreate -L 24G -n swap vg
sudo lvcreate -l '100%FREE' -n root vg
```

```{bash}
sudo mkfs.ext2 /dev/sda2 -U 933c1d16-e734-4d7c-879a-834497581785
sudo mkfs.ext4 -L root /dev/vg/root -U 009b54b4-d4a1-427f-8471-1ea2fcd52a1b
sudo mkswap -L swap /dev/vg/swap -U 3adc58f0-5602-406d-82a1-7605c88e7ee4
```

```{bash}
sudo mount /dev/vg/root /mnt
sudo mkdir /mnt/boot
sudo mount /dev/sda2 /mnt/boot
sudo swapon /dev/vg/swap
```

### The rest

Run the following to make the installation:
```{bash}
nix-shell -p git --run "git clone https://github.com/magnouvean/nixos-configs"
nix-shell -p git --run "sudo nixos-install --flake ./nixos-configs#nixos-desktop"
sudo poweroff
```

## Sources
[This was heavily inspired by this github gist (thanks to marijnvermaat on github)]( https://gist.github.com/martijnvermaat/76f2e24d0239470dd71050358b4d5134)
