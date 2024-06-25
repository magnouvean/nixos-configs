{ ... }: {
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
      device = "/dev/disk/by-uuid/1d1131ba-3652-4322-9d82-7e4c29693a62";
      preLVM = true;
      allowDiscards = true;
    };
  };

  # Enable displaylink
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
}
