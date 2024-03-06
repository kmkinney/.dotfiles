{pkgs, ...}:
pkgs.writeShellScriptBin "dotfiles" ''
  echo "Rebuilding..."
  pushd ~/.dotfiles/nixos/home-manager/
  ${pkgs.neovim}/bin/nvim $(${pkgs.fd}/bin/fd . ~/.dotfiles/nixos/home-manager/ -t f | ${pkgs.fzf}/bin/fzf)
  ${pkgs.git}/bin/git add .
  ${pkgs.git}/bin/git commit -m "Updated dotfiles"
  ${pkgs.home-manager}/bin/home-manager switch --flake .
  popd
''