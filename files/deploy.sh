#!/bin/sh

flake_dir=$(dirname $(dirname $(dirname $0)))
sudo nixos-rebuild switch --flake $flake_dir $1 || exit
