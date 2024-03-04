{pkgs, ...}:
pkgs.writeShellScriptBin "rebuild" ''
  echo "Rebuilding..."
  pushd ~/.dotfiles/nixos/home-manager/
  ${pkgs.neovim}/bin/nvim .
  ${pkgs.git}/bin/git commit -am "Rebuild"
  ${pkgs.home-manager}/bin/home-manager switch --flake .
  popd
''
