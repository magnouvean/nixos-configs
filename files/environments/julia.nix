{ pkgs ? import <nixpkgs> { } }:
let
  juliaPackages = [ "Plots" ];
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Julia
    (julia.withPackages juliaPackages)

    # Latex
    pandoc
    texlab
    texlive.combined.scheme-full
  ];
}
