{ lib, ... }:
let
  stignoreFolders = [ "Ebooks" "Music" "Pictures" "Sync" "Videos" ];
  stignoreToAttrs = folder: {
    "${folder}/.stignore".source = ../files/syncthing/stignore;
  };
  stignoreAttrs = lib.mkMerge (map stignoreToAttrs stignoreFolders);
in
{
  home.file = lib.mkMerge [{
    ".config/MangoHud/MangoHud.conf".source = ../files/mangohud/MangoHud.conf;
    # Environments
    "Code/nix/shell.nix".source = ../files/environments/nix.nix;
    "Code/nix/.envrc".text = "use nix";
    "Code/python/shell.nix".source = ../files/environments/python.nix;
    "Code/python/.envrc".text = "use nix";
    "Code/julia/shell.nix".source = ../files/environments/julia.nix;
    "Code/julia/.envrc".text = "use nix";
    "Code/R/shell.nix".source = ../files/environments/R.nix;
    "Code/R/.envrc".text = "use nix";
  }
    stignoreAttrs];
}
