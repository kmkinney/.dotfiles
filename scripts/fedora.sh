#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"
REPO="https://github.com/kmkinney/.dotfiles"

set -euo pipefail

echo "Installing hyprland"
sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprland

# Clone and install dots
echo "Setting up home-manager"
[[ -d "$DOTFILES" ]] || git clone "$REPO" "$DOTFILES"

nix run home-manager/master -- \
  -b backup \
  --flake \
  --impure \
  "$DOTFILES"
