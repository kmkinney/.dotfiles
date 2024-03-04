{pkgs, ...}: {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    neovim
    git
    kitty
  ];
  programs.home-manager.enable = true;

  # Dotfiles using nix
  imports = [
    ./config/kitty.nix
    ./config/git.nix
  ];

  # Dotfiles using their own files
  home.file = {
    ".zshrc".source = ./config/zshrc.zsh;
    ".tmux.conf".source = ./config/tmux.conf;
    ".p10k.zsh".source = ./config/p10k.zsh;
    ".config/nvim".source = ./config/nvim;
  };
}
