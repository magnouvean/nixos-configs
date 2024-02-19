{ ... }:
{
  imports = [ ../../home/home.nix ];

  # Since the machine supports ROCM the pytorch with rocm is better.
  home.file."Code/python/local.nix".text = ''
    { pkgs ? import <nixpkgs> {} }:
    [ pkgs.python3Packages.torchWithRocm ]
  '';
}
