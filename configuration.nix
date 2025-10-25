{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  networking.hostName = "nixos-desktop"; # Define your hostname.
  time.timeZone = "Europe/Oslo";

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [ networkmanager-openvpn ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "no";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.magnus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  services.blueman.enable = true;
  programs.nm-applet.enable = true;

  programs.steam.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.git.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
        user = "greeter";
      };
      default_session = initial_session;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  programs.hyprland.enable = true;
  programs.waybar.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    proggyfonts
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [
    bat
    bitwarden-desktop
    brave
    dracula-theme
    eza
    godot
    htop
    hyprlock
    hyprpaper
    hyprshot
    hyprpolkitagent
    jq
    kitty
    llama-cpp
    lm_sensors
    lxqt.lxqt-policykit
    networkmanagerapplet
    osu-lazer-bin
    papirus-icon-theme
    pcmanfm
    swayidle
    syncthing
    vim
    wlr-randr
    wofi
    zed-editor
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
