{
  pkgs,
  system,
  config,
  ...
}: {
  home.username = "kevin";
  home.homeDirectory =
    if system == "x86_64-linux"
    then "/home/kevin/"
    else "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    alejandra
    git
    kitty
    lazygit
    ranger
    btop
    gh

    nodejs_20
    nodePackages.pnpm
    rust-analyzer

    # Custom scripts
    (import ../scripts/dotfiles.nix {inherit pkgs;})
  ];
  programs.home-manager.enable = true;

  imports = [
    (import ./modules/neovim.nix {inherit config;})
  ];

  # Dotfiles using their own files
  home.file = {
    ".bash_aliases".source = ./dotfiles/bash_aliases.sh;
    ".bashrc".source = ./dotfiles/bashrc.sh;
    ".gitconfig".source = ./dotfiles/gitconfig.conf;
    ".zshrc".source = ./dotfiles/zshrc.zsh;
    ".tmux.conf".source = ./dotfiles/tmux.conf;
    ".p10k.zsh".source = ./dotfiles/p10k.zsh;
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper.conf;
    ".config/kitty/kitty.conf".source = ./dotfiles/kitty.conf;
    ".config/dunst/dunstrc".source = ./dotfiles/dunstrc.cfg;
    ".config/waybar/config".source = ./dotfiles/waybar.jsonc;
    ".config/waybar/style.css".source = ./dotfiles/waybar.css;
  };
}
