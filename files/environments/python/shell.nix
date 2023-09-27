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
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium dvisvgm dvipng wrapfig amsmath ulem hyperref capt-of;
    })
  ]) ++ (with pkgs.python3Packages; [
    # Python libraries
    debugpy
    ipython
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
    sympy
    # tensorflow
  ]);
}
