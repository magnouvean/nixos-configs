{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # R
    R

    # Jupyter
    python3Packages.jupyter

    # Latex
    pandoc
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium dvisvgm dvipng wrapfig amsmath ulem hyperref capt-of;
    })
  ]) ++ (with pkgs.rPackages; [
    # R libraries
    IRkernel
    MASS
    languageserver
    styler
    testthat
    tidyverse
  ]);
}
