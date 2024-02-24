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
