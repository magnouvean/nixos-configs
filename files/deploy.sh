#!/bin/sh

flake_dir=$(dirname $(dirname $(dirname $0)))
sudo nixos-rebuild switch --flake $flake_dir $1 || exit

if ! [ -d ~/.config/nvim ]; then
  git clone https://github.com/magnouvean/NvChad ~/.config/nvim
fi
cd ~/.config/nvim && git pull
