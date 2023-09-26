#!/bin/sh

cwd=$(dirname $0)
sudo nixos-rebuild -I nixos-config=$cwd/configuration.nix switch $1
