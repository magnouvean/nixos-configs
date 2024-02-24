{ pkgs ? import <nixpkgs> { } }:
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
    keras
    matplotlib
    nltk
    numpy
    pandas
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
    torch
    torchvision
    xgboost
  ]);
}
