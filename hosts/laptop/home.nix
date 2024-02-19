{ ... }:
{
  imports = [ ../../home/home.nix ];

  # Need to use pytorch with cpu only
  home.file."Code/python/local.nix".text = ''
    { pkgs ? import <nixpkgs> {} }:
    [ pkgs.python3Packages.torch ]
  '';
}
