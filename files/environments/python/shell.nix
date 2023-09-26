{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [ black isort mypy python3 pandoc ])
    ++ (with pkgs.python3Packages; [
    debugpy
    ipython
    jupyter
    jupytext
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
    sympy
    # tensorflow
  ]);
}
