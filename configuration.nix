{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    bat
    bitwarden-desktop
    brave
    eza
    godot
    htop
    jq
    lm_sensors
    networkmanagerapplet
    onlyoffice-desktopeditors
    osu-lazer-bin
    syncthing
    vim
    zed-editor
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  networking.useDHCP = lib.mkDefault true;

  system.stateVersion = "25.05"; # Did you read the comment?
}
