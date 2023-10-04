{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Julia
    julia-bin

    # Jupyter
    python3Packages.jupyter

    # Latex
    pandoc
    texlive.combined.scheme-full
  ];
}
