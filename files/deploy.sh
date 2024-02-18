#!/bin/sh

flake_dir=$(dirname $(dirname $(dirname $0)))
sudo nixos-rebuild switch --flake $flake_dir $1 || exit

vscode_extensions=(
    "Continue.continue"
    "James-Yu.latex-workshop"
    "REditorSupport.r"
    "dracula-theme.theme-dracula"
    "geequlim.godot-tools"
    "haskell.haskell"
    "jnoortheen.nix-ide"
    "julialang.language-julia"
    "mkhl.direnv"
    "ms-pyright.pyright"
    "ms-python.black-formatter"
    "ms-python.isort"
    "ms-python.python"
    "ms-toolsai.jupyter"
    "streetsidesoftware.code-spell-checker"
    "sumneko.lua"
    "vscodevim.vim"
)
for ext in ${vscode_extensions[@]}; do
    codium --install-extension $ext
done