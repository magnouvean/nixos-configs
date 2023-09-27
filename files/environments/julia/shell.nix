{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Julia
    julia-bin

    # Jupyter
    python3Packages.jupyter

    # Latex
    pandoc
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium dvisvgm dvipng wrapfig amsmath ulem hyperref capt-of;
    })
  ];
}
