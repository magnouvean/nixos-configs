{ ... }:
{
  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/sda2";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
