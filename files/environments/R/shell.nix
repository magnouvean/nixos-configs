{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # R
    R

    # Jupyter
    python3Packages.jupyter
    rPackages.IRkernel

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
    lme4
    nlme
    nnet
    styler
    testthat
    tidyverse
  ]);
}
