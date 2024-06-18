{ config, ... }: {
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
      device = "/dev/sda3";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
