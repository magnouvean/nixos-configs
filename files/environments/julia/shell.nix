{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Julia
    julia-bin

    # Jupyter
    python3Packages.jupyter

    # Latex
    pandoc
    texlab
    texlive.combined.scheme-full
  ];
}
