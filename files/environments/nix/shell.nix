{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell { nativeBuildInputs = [ nixfmt rnix-lsp ]; }
