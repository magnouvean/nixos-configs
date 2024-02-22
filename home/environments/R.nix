{ ... }:
let
  commonAttrs = (import ./common.nix { });
in
''
  { pkgs ? import <nixpkgs> { } }:
  pkgs.mkShell {
    nativeBuildInputs = (with pkgs; [
      # R
      R
      python3Packages.radian

      # Jupyter
      python3Packages.jupyter
      rPackages.IRkernel

      # Latex
      ${builtins.concatStringsSep "\n    " commonAttrs.latexPackages}

    ]) ++ (with pkgs.rPackages; [
      # R libraries
      IRkernel
      MASS
      VGAM
      bnlearn
      gRain
      igraph
      languageserver
      lme4
      nlme
      nnet
      pcalg
      plotly
      styler
      testthat
      tidyverse
    ]);
  }
''
