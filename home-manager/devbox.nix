# Headless profile for remote devboxes — terminal subset of home.nix
{pkgs, ...}: {
  imports = [
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/terminal/zsh.nix
    ./modules/terminal/tmux.nix
    ./modules/terminal/zoxide.nix
  ];

  home.packages = with pkgs; [
    ripgrep
  ];

  home.username = "kevin";
  home.homeDirectory = "/home/kevin";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
