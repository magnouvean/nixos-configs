{ ... }:
{
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-laptop";

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/40a4c612-7b66-4abf-b23d-6eea5ff4d85d";
      preLVM = true;
      allowDiscards = true;
    };
  };

  # Enable displaylink
  services.xserver.videoDrivers = [
    "displaylink"
    "modesetting"
  ];
}
