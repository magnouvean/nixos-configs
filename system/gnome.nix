{ pkgs, ... }:
let
  # Make gnome-terminal link to kitty because this is the only way to set the
  # default terminal in gnome at the moment.
  gnome-terminal-wrapper = pkgs.runCommand "gnome-terminal-wrapper"
    {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
    mkdir -p $out/bin
    ln -s ${pkgs.kitty}/bin/kitty $out/bin/gnome-terminal
  '';
in
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [ gnome-tour gnome-console ])
    ++ (with pkgs.gnome; [ cheese gnome-music gedit geary gnome-characters ]);

  environment.systemPackages = ([ gnome-terminal-wrapper ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    pop-shell
  ]);
}
