# Installation

## Partitioning

I recommend using `gdisk` for paritioning

- 512M boot parition (`8300`) at /dev/sda1
- Rest of the space (`8300`) at /dev/sda2

## Installation

### Preparation

After formatting as described above run the following commands (as root and with internet):
```{bash}
sudo cryptsetup luksFormat /dev/sda2 --type luks1
sudo cryptsetup luksOpen /dev/sda2 enc-pv
```

```{bash}
sudo pvcreate /dev/mapper/enc-pv
sudo vgcreate vg /dev/mapper/enc-pv
sudo lvcreate -L 24G -n swap vg
sudo lvcreate -l '100%FREE' -n root vg
```

```{bash}
sudo mkfs.fat /dev/sda1 -i
sudo mkfs.ext4 -L root /dev/vg/root -U
sudo mkswap -L swap /dev/vg/swap -U
```

```{bash}
sudo mount /dev/vg/root /mnt
sudo mkdir -p /mnt/boot/efi
sudo mount /dev/sda1 /mnt/boot/efi
sudo swapon /dev/vg/swap
```

### The rest

Clone this repo:
```{bash}
nix-shell -p git
git clone https://codeberg.org/magnouvean/nixos-configs
```

Finally run:
```{bash}
sudo nixos-install --flake ./nixos-configs#nixos-desktop
sudo reboot
```

## Sources
[This was heavily inspired by this github gist (thanks to marijnvermaat on github)]( https://gist.github.com/martijnvermaat/76f2e24d0239470dd71050358b4d5134)
