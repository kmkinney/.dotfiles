# NOT SUPPORTED ATM
{pkgs, ...}:
pkgs.writeShellScriptBin "nixconfig" ''
  echo "Rebuilding nixos and home-manager configurations..."
  pushd ~/.dotfiles/nixos/
  ${pkgs.neovim}/bin/nvim .
  ${pkgs.git}/bin/git commit -am "(Nix update) $(date)"
  sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake .
  pushd ~/.dotfiles/nixos/home-manager/
  ${pkgs.home-manager}/bin/home-manager switch --flake .#linux
  popd
  popd
''
