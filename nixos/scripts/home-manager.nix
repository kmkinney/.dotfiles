# NOT SUPPORTED ATM
{pkgs, ...}:
pkgs.writeShellScriptBin "hms" ''
  echo "Rebuilding home manager"
  ${pkgs.home-manager}/bin/home-manager switch --flake $HOME/.dotfiles
''
