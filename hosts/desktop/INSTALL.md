# Installation

## Partitioning

I recommend using `gdisk` for paritioning

- 512M boot parition (`8300`) at /dev/sda1
- Rest of the space (`8300`) at /dev/sda2

## Installation

### Preparation

After formatting as described above run the following commands (as root and with internet):
```{bash}
sudo cryptsetup luksFormat /dev/sda2
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
sudo mkdir /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo swapon /dev/vg/swap
```

### The rest

```{bash}
nix-shell -p git
git clone https://codeberg.org/magnouvean/nixos-configs
```

Remove the displaylink configuration located in `system/kde.nix`, for example
using:
```{bash}
vim nixos-configs/system/kde.nix
```
This should be one line, and the whole line can be deleted.
Finally run:
```{bash}
sudo nixos-install --flake ./nixos-configs#nixos-desktop
sudo reboot
```

## After installation
After installation it should be enough to run `./deploy.sh` (in this
directory). You will however have had to run (at least once) the following
command:
```{bash}
sudo nix-prefetch-url --name displaylink-580.zip https://www.synaptics.com/sites/default/files/exe_files/2023-08/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.8-EXE.zip
```

## Sources
[This was heavily inspired by this github gist (thanks to marijnvermaat on github)]( https://gist.github.com/martijnvermaat/76f2e24d0239470dd71050358b4d5134)
