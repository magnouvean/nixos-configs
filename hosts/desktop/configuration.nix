{ config, ... }: {
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";

  boot.loader.grub = {
    device = "/dev/sda";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/sda2";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
