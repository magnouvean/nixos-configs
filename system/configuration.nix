{ pkgs, ... }:
{
  imports = [ ./kde.nix ];

  # Bootloader
  boot.loader.grub.enable = true;

  # Neworking
  networking.networkmanager.enable = true;

  # Games
  programs.steam.enable = true;

  # AI
  services.ollama.enable = true;

  # Podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Users
  users.users.user1 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "storage" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Shell
  programs.zsh.enable = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Fonts
  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # GPG
  programs.gnupg.agent.enable = true;

  # Polkit
  security.polkit.enable = true;

  # Git
  programs.git.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # GUI programs
    bitwarden-desktop
    brave
    haruna
    neovide
    rnote

    # CLI tools
    android-tools
    bat
    curl
    distrobox
    eza
    fastfetch
    htop
    lm_sensors
    neovim
    ripgrep
    unzip
    wget
    wl-clipboard
    yt-dlp

    # Other
    xdg-user-dirs
    xdg-utils
  ];

  # Misc
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
