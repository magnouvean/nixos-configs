{ ... }:
{
  imports = [
    ../../configuration.nix
    ./hardware-configuration.nix
  ];

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
  };

  service.xserver = {
    videoDrivers = [ "nvidia" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/40a4c612-7b66-4abf-b23d-6eea5ff4d85d";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AEB1-E5FE";
    fsType = "vfat";
  };
  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/1d1131ba-3652-4322-9d82-7e4c29693a62";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
