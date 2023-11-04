{ pkgs ? import <nixpkgs> { } }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-medium dvisvgm dvipng wrapfig amsmath ulem hyperref capt-of;
  });
in with pkgs; mkShell { nativeBuildInputs = [ pandoc tex texlab ]; }
