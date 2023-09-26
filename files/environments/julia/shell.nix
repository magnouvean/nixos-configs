{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    julia-bin
    pandoc
    python3Packages.jupyter
    python3Packages.jupytext
  ];
}
