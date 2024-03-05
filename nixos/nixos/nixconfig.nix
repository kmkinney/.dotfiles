{pkgs, ...}:
pkgs.writeShellScriptBin "nixconfig" ''
  echo "Rebuilding..."
  pushd ~/.dotfiles/nixos/nixos/
  ${pkgs.neovim}/bin/nvim .
  ${pkgs.git}/bin/git commit -am "Updated nixos config"
  sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake .
  popd
''
