{ config, lib, ... }:
let
  languages = [
    "R"
    "godot"
    "haskell"
    "julia"
    "misc"
    "nix"
    "python"
  ];
  languageToAttrs = lang: {
    "Code/${lang}/.envrc".text = "use nix";
    "Code/${lang}/tmp/README.md".text = ''
      # Environment directories
      Run `direnv allow` to get started.
    '';
  };
  languageAttrs = lib.mkMerge (map languageToAttrs languages);
  shellNixAttrs = {
    "Code/python/shell.nix".text = ''
      { pkgs ? import <nixpkgs> { } }:
      let
        localPath = ${config.home.homeDirectory}/Code/python/local.nix;
      in
      pkgs.mkShell {
        nativeBuildInputs = (with pkgs; [
          # Python
          black
          isort
          mypy
          python3

          # Latex
          pandoc
          texlab
          texlive.combined.scheme-full

          # Other
          kaggle
        ]) ++ (with pkgs.python3Packages; [
          # Python libraries
          debugpy
          graphviz
          imageio
          ipython
          jax
          jaxlib
          jupyter
          keras
          matplotlib
          nltk
          numpy
          pandas
          pip
          pyarrow
          pycodestyle
          pydocstyle
          pyflakes
          pyqt6
          pytest
          ray
          scikit-learn
          scipy
          seaborn
          spacy
          spacy_models.en_core_web_sm
          sympy
          tensorflow
          torchWithRocm
          torchvision
          xgboost
        ]) ++ (pkgs.lib.optional (builtins.pathExists localPath) (import localPath { }));
      }
    '';

    "Code/R/shell.nix".text = ''
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
          pandoc
          texlab
          texlive.combined.scheme-full
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
          styler
          testthat
          tidyverse
        ]);
      }
    '';

    "Code/nix/shell.nix".text = ''
      { pkgs ? import <nixpkgs> { } }:
      with pkgs;
      mkShell { nativeBuildInputs = [ nixpkgs-fmt nixfmt nil ]; }
    '';

    "Code/haskell/shell.nix".text = ''
      { pkgs ? import <nixpkgs> { } }:
      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # Haskell
          ghc
          haskell-language-server
        ];
      }
    '';

    "Code/julia/shell.nix".text = ''
      { pkgs ? import <nixpkgs> { } }:
      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # Julia
          julia-bin

          # Latex
          pandoc
          texlab
          texlive.combined.scheme-full
        ];
      }
    '';

    "Code/godot/shell.nix".text = ''
      { pkgs ? import <nixpkgs> { } }:
      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # Godot
          godot_4
        ];
      }
    '';
  };

in
{
  home.file = lib.mkMerge [
    languageAttrs
    shellNixAttrs
  ];
}
