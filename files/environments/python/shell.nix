{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # Python
    black
    isort
    mypy
    pyright
    python3

    # Latex
    pandoc
    texlive.combined.scheme-full
  ]) ++ (with pkgs.python3Packages; [
    # Python libraries
    debugpy
    ipython
    jax
    jaxlib
    jupyter
    keras
    matplotlib
    numpy
    pandas
    pycodestyle
    pydocstyle
    pyflakes
    pyqt6
    pytest
    python-lsp-black
    python-lsp-server
    pytorch
    scikit-learn
    scipy
    seaborn
    sympy
    tensorflow
    xgboost
  ]);
}
