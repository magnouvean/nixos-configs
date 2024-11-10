{ ... }:
{
  imports = [
    ../../system/configuration.nix
    ./hardware-configuration.nix
  ];

  # Nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };
  nixpkgs.config.cudaSupport = true;
  hardware.nvidia-container-toolkit.enable = true;

  # Filesystems/disks
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/009b54b4-d4a1-427f-8471-1ea2fcd52a1b";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/933c1d16-e734-4d7c-879a-834497581785";
    fsType = "ext2";
  };
  boot.loader.grub = {
    device = "/dev/sda";
    efiSupport = false;
  };
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/b17f7d5a-6e7d-4357-8f30-4d5a98a39d62";
      preLVM = true;
      allowDiscards = true;
    };
  };

  # Misc
  networking.hostName = "nixos-desktop";
}
