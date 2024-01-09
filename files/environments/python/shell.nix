{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # Python
    black
    isort
    mypy
    python3

    # Jupyter
    python3Packages.jupyter

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
    python-lsp-black
    python-lsp-server
    pytorch
    ray
    scikit-learn
    scipy
    seaborn
    spacy
    spacy_models.en_core_web_sm
    sympy
    tensorflow
    xgboost
  ]);
}
