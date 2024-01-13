{ config, lib, pkgs, ... }:
{
  imports = [ ./kde.nix ];

  # Bootloader
  boot.loader.grub = { enable = true; };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_6_5;

  # Neworking
  networking = {
    networkmanager.enable = true;
  };
  services.openssh = {
    enable = true;
  };

  # Printer support
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Games
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  # Time/Locale
  time.timeZone = "Europe/Oslo";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "nb_NO.UTF-8";
    };
  };
  console = { keyMap = "no"; };

  # Sound
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Wacom tablet support
  hardware.opentabletdriver.enable = true;

  # Users
  users.users.magnus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "storage" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Shell
  programs.zsh.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Fonts
  fonts = {
    packages = with pkgs;
      [ (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) ];
  };

  # GPG
  programs.gnupg.agent = { enable = true; };

  # Polkit
  security.polkit = { enable = true; };

  # SSH
  programs.ssh.askPassword = "";

  # Packages
  environment.systemPackages = with pkgs; [
    # GUI programs
    brave
    ferdium
    godot_4
    joplin-desktop
    kitty
    krita
    libreoffice-qt

    # CLI tools
    android-tools
    bat
    curl
    eza
    gh
    htop
    lm_sensors
    neofetch
    networkmanagerapplet
    pass-wayland
    ripgrep
    shell_gpt
    sshfs
    unzip
    vim
    wget
    wl-clipboard

    # Other
    xdg-user-dirs
    xdg-utils

    # Games
    mangohud
    osu-lazer-bin
  ];

  # Misc
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}

