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

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

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

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/40a4c612-7b66-4abf-b23d-6eea5ff4d85d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AEB1-E5FE";
    fsType = "vfat";
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/a6f74323-d256-47c1-92aa-5659c85866aa";
    fsType = "ext4";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
