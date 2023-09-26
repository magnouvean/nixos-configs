{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs =
    (with pkgs; [
      R
      pandoc
      python3Packages.jupyter
      python3Packages.jupytext
    ]) ++ (with pkgs.rPackages; [
      IRkernel
      MASS
      languageserver
      styler
      testthat
      tidyverse
    ]);
}
