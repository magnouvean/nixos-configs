{ ... }:
''
  { pkgs ? import <nixpkgs> { } }:
  with pkgs;
  mkShell { nativeBuildInputs = [ nixpkgs-fmt nixfmt nil ]; }
''
