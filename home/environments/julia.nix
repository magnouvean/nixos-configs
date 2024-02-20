{ ... }:
let
  commonAttrs = (import ./common.nix { });
in
''
  { pkgs ? import <nixpkgs> { } }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      # Julia
      julia-bin

      # Latex
      ${builtins.concatStringsSep "\n    " commonAttrs.latexPackages}
    ];
  }
''
