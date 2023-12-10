{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    # Haskell
    ghc
    haskell-language-server
  ];
}
