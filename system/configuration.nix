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

  # Games
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  # Time/Locale
  time.timeZone = "Europe/Oslo";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      # 24 hour time
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
  users.users.user1 = {
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

  # Packages
  environment.systemPackages = with pkgs; [
    # GUI programs
    brave
    krita
    rnote

    # CLI tools
    android-tools
    bat
    curl
    eza
    htop
    lm_sensors
    neofetch
    ollama
    pass-wayland
    ripgrep
    sshfs
    unzip
    vim
    wget
    wl-clipboard

    # Other
    xdg-user-dirs
    xdg-utils

    # Themes
    bibata-cursors
    candy-icons
    dracula-theme

    # Games
    mangohud
    osu-lazer-bin
  ];

  # Misc
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}

