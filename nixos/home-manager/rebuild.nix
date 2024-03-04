{pkgs, ...}:
pkgs.writeShellScriptBin "rebuild" ''
  echo "Rebuilding..."
  pushd ~/.dotfiles/nixos/home-manager/
  ${pkgs.neovim}/bin/nvim $(${pkgs.fd}/bin/fd . ~/.dotfiles/nixos/home-manager/ -t f -x ${pkgs.fzf}/bin/fzf --preview "bat --style=numbers,changes --color=always {}")
  ${pkgs.git}/bin/git commit -am "Rebuild"
  ${pkgs.home-manager}/bin/home-manager switch --flake .
  popd
''
