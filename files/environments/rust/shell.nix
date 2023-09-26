{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  nativeBuildInputs = [ cargo clippy rust-analyzer rust-script rustc rustfmt ];
}
