{pkgs, ...}: let
  configDir = ~/.dotfiles/nixos/home-manager;
in
  pkgs.writeShellScriptBin "rebuild" ''
    echo "Rebuilding..."
    pushd ${configDir}
    ${pkgs.neovim}/bin/nvim .
    ${pkgs.git}/bin/git commit -am "Rebuild"
    ${pkgs.home-manager}/bin/home-manager switch --flake .
    popd
  ''
