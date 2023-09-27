{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [ ./gnome.nix (import "${home-manager}/nixos") ];

  # Bootloader
  boot.loader.grub = { enable = true; };

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

  # Users
  users.users.magnus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "storage" "networkmanager" ];
    shell = pkgs.zsh;
  };
  # And home-manager
  home-manager.users.magnus = (import ../home/home.nix);

  # Shell
  programs.zsh.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  
  # Better tablet support
  hardware.opentabletdriver.enable = true;

  # Fonts
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };

  # GPG
  programs.gnupg.agent = {
    enable = true;
  };

  # Polkit
  security.polkit = { enable = true; };

  # SSH
  programs.ssh.askPassword = "";

  # Packages
  environment.systemPackages = with pkgs; [
    # GUI programs
    # g4music
    blackbox-terminal
    ferdium
    firefox
    gimp
    godot_4
    rnote
    zathura

    # CLI tools
    android-tools
    bat
    curl
    distrobox
    eza
    git
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

    # Games
    osu-lazer-bin
  ];

  # Podman
  virtualisation = {
    podman = {
      enable = true;
    };
  };

  # Misc
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
