{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # R
    R

    # Jupyter
    python3Packages.jupyter

    # Latex
    pandoc
    texlab
    texlive.combined.scheme-full
  ]) ++ (with pkgs.rPackages; [
    # R libraries
    IRkernel
    MASS
    VGAM
    languageserver
    nlme
    nnet
    styler
    testthat
    tidyverse
  ]);
}
