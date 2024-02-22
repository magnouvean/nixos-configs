{ rocmSupport, ... }:
let
  commonAttrs = (import ./common.nix { });
in
''
  { pkgs ? import <nixpkgs> { } }:
  pkgs.mkShell {
    nativeBuildInputs = (with pkgs; [
      # Python
      black
      isort
      mypy
      python3

      # Latex
      ${builtins.concatStringsSep "\n    " commonAttrs.latexPackages}

      # Other
      kaggle
    ]) ++ (with pkgs.python3Packages; [
      # Python libraries
      ${if rocmSupport then "torchWithRocm" else "torch"}
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
      plotly
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
      torchvision
      xgboost
    ]);
  }
''
