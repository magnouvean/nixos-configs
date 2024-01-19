{ config, ... }: {
  imports = [
    ../../system/configuration.nix
    ../uefi_common.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-laptop";

  # Enable displaylink
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
}
