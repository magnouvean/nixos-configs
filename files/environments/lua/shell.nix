{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = (with pkgs; [
    # Lua
    lua
    lua-language-server
  ]);
}
