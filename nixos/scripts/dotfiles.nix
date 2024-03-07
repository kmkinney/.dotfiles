{pkgs, ...}:
pkgs.writeShellScriptBin "dotfiles" ''
  echo "Rebuilding..."
  ${pkgs.neovim}/bin/nvim $(${pkgs.fd}/bin/fd . ~/.dotfiles/nixos/home-manager/ -t f | ${pkgs.fzf}/bin/fzf)
  ${pkgs.git}/bin/git add .
  ${pkgs.git}/bin/git commit -m "Updated dotfiles"
  pushd ~/.dotfiles/nixos/home-manager/
  ${pkgs.home-manager}/bin/home-manager switch --flake .#linux
  popd
''
