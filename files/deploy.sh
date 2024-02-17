#!/bin/sh

flake_dir=$(dirname $(dirname $(dirname $0)))
sudo nixos-rebuild switch --flake $flake_dir $1 || exit

[ -d ~/.config/nvim ] || git clone https://github.com/magnouvean/NvChad ~/.config/nvim
cd ~/.config/nvim && git pull