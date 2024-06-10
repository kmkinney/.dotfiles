#!/bin/bash
curl -L https://nixos.org/nix/install | sh
git clone https://github.com/kmkinney/.dotfiles
nix --extra-experimental-features nix-command run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ./.dotfiles
