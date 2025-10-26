{ pkgs, lib, ... }:
let
  sddm-breeze-custom = pkgs.stdenv.mkDerivation {
    pname = "sddm-breeze-custom";
    version = "1.0.0";
    dontBuild = true;
    dontUnpack = true;
    src = pkgs.fetchurl {
      url = "https://images.pexels.com/photos/163848/road-mountains-sunset-path-163848.jpeg";
      hash = "sha256-1pLDjQfimAhA/mKE2yldDXRpFP7kEJE3A6lP1S3JKuU=";
    };
    installPhase = ''
      mkdir -p $out/share/sddm/themes/
      cp -aR ${pkgs.kdePackages.plasma-desktop}/share/sddm/themes/breeze $out/share/sddm/themes/breeze-custom
      chmod +w $out/share/sddm/themes/breeze-custom $out/share/sddm/themes/breeze-custom/theme.conf
      cp -aR $src $out/share/sddm/themes/breeze-custom/background.jpg
      sed -i 's/background=.*/background=background.jpg/g' $out/share/sddm/themes/breeze-custom/theme.conf
    '';
  };
in
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

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze-custom";
  };
  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kate
  ];

  system.activationScripts.sddmSetBreezeDark.text = ''
    if [ -d /var/lib/sddm/.config ]; then rm -rf /var/lib/sddm/.config; fi
    mkdir -p /var/lib/sddm/.config
    cp ${./files/sddm/sddm-kdeglobals} /var/lib/sddm/.config/kdeglobals
    cp ${./files/sddm/sddm-kcminputrc} /var/lib/sddm/.config/kcminputrc
  '';

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
    jq
    kdePackages.sddm-kcm
    kitty
    llama-cpp
    lm_sensors
    networkmanagerapplet
    onlyoffice-desktopeditors
    osu-lazer-bin
    sddm-breeze-custom
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
