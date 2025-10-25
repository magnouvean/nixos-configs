# Installation

## Partitioning

I recommend using `gdisk` for paritioning

- 512M boot parition (`ef00`) at /dev/sda1
- Rest of the space (`8300`) at /dev/sda2

## Installation

### Preparation

After formatting as described above run the following commands (as root and with internet):

```{bash}
sudo cryptsetup luksFormat /dev/sda2
sudo cryptsetup luksOpen /dev/sda2 enc-pv
sudo cryptsetup luksUUID /dev/sda2 --uuid "1d1131ba-3652-4322-9d82-7e4c29693a62"
```

```{bash}
sudo pvcreate /dev/mapper/enc-pv
sudo vgcreate vg /dev/mapper/enc-pv
sudo lvcreate -L 8G -n swap vg
sudo lvcreate -l '100%FREE' -n root vg
```

```{bash}
sudo mkfs.fat /dev/sda1 -i aeb1e5fe
sudo mkfs.ext4 -L root /dev/vg/root -U 40a4c612-7b66-4abf-b23d-6eea5ff4d85d
sudo mkswap -L swap /dev/vg/swap -U fd9a1b38-9b0f-4eeb-a880-5b5980f8d1ed
```

```{bash}
sudo mount /dev/vg/root /mnt
sudo mkdir /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo swapon /dev/vg/swap
```

### The rest

Clone this repo:

```{bash}
nix-shell -p git --run "git clone https://github.com/magnouvean/nixos-configs"
```

Finally run the following to make the installation:

```{bash}
nix-shell -p git --run "sudo nixos-install --flake ./nixos-configs#nixos-desktop"
sudo poweroff
```
