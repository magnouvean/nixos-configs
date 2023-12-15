{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell { nativeBuildInputs = [ nixpkgs-fmt nixfmt rnix-lsp ]; }
