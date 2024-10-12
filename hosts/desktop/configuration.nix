{ ... }:
{
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";

  boot.loader.grub = {
    device = "/dev/sda";
    efiSupport = false;
  };
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/b17f7d5a-6e7d-4357-8f30-4d5a98a39d62";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
