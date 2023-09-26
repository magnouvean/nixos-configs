# Installation

## Partitioning

I recommend using ~gdisk~ for paritioning

- 1M BIOS boot parition (~ef02~) at /dev/sda1
- 512M boot parition (~8300~) at /dev/sda2
- Rest of the space (~8300~) at /dev/sda3

## Installation (System)
After formatting as described above run the following commands (as root and with internet):
```{bash}
sudo cryptsetup luksFormat /dev/sda2
sudo cryptsetup luksOpen /dev/sda2 enc-pv
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

```{bash}
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixos
sudo nix-channel --update
```

```{bash}
nix-shell -p git
sudo mkdir -p /mnt/etc/nixos
sudo git clone https://codeberg.org/magnouvean/nixos-configs /mnt/etc/nixos/configs
sudo ln -s /mnt/etc/nixos/configs/hosts/laptop/configuration.nix /mnt/etc/nixos/configuration.nix
sudo nixos-install
sudo rm -rf /mnt/etc/nixos
reboot
```

After installation it should be enough to run `./deploy.sh` (in this directory)

## Sources
[This was heavily inspired by this github gist (thanks to marijnvermaat on github)]( https://gist.github.com/martijnvermaat/76f2e24d0239470dd71050358b4d5134)
