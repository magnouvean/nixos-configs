{ config, lib, pkgs, ... }:
{
  imports = [ ./kde.nix ];

  # Bootloader
  boot.loader.grub = { enable = true; };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Neworking
  networking = {
    networkmanager.enable = true;
    extraHosts = builtins.readFile ../files/hosts;
  };

  # Time/Locale
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";
  console = { keyMap = "no"; };

  # Games
  programs.steam.enable = true;

  # Sound
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

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
    ferdium
    firefox
    godot_4
    kitty
    krita
    libreoffice-qt
    rnote

    # CLI tools
    android-tools
    bat
    curl
    distrobox
    eza
    gh
    htop
    lm_sensors
    mpc_cli
    networkmanagerapplet
    pass-wayland
    ripgrep
    unzip
    vim
    wget
    wl-clipboard

    # Other
    xdg-user-dirs
    xdg-utils
  ];

  # Podman
  virtualisation = { podman = { enable = true; }; };

  # Misc
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}

