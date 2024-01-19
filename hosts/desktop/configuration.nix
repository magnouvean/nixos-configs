{ config, ... }: {
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";

  boot.loader.grub = {
    device = "/dev/disk/by-id/wwn-0x50014ee20fa211a7";
    efiSupport = false;
  };
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/009b54b4-d4a1-427f-8471-1ea2fcd52a1b";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
