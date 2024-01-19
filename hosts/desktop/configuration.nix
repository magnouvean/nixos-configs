{ config, ... }: {
  imports = [
    ../../system/configuration.nix
    ../uefi_common.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-desktop";
}
