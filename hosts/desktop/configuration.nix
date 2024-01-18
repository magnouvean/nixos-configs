{ config, ... }: {
  imports = [
    ../../system/configuration.nix
    ../uefi_common
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";
}
