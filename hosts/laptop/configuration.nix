{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    ../../configuration.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking.hostName = "nixos-laptop";

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/1d1131ba-3652-4322-9d82-7e4c29693a62";
      preLVM = true;
      allowDiscards = true;
    };
  };

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/40a4c612-7b66-4abf-b23d-6eea5ff4d85d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AEB1-E5FE";
    fsType = "vfat";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/fd9a1b38-9b0f-4eeb-a880-5b5980f8d1ed"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
