{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell { nativeBuildInputs = [ clang-tools gcc gdb ]; }
