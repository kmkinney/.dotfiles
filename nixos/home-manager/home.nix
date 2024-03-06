{
  pkgs,
  system,
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

    # Custom scripts
    (import ../scripts/dotfiles.nix {inherit pkgs;})
  ];
  programs.home-manager.enable = true;

  imports = [
    ./neovim.nix
  ];

  # Dotfiles using their own files
  home.file = {
    ".gitconfig".source = ./dotfiles/gitconfig.conf;
    ".zshrc".source = ./dotfiles/zshrc.zsh;
    ".tmux.conf".source = ./dotfiles/tmux.conf;
    ".p10k.zsh".source = ./dotfiles/p10k.zsh;
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper.conf;
    ".config/dunst/dunstrc".source = ./dotfiles/dunstrc.cfg;
    ".config/waybar/dotfiles".source = ./config/waybar.jsonc;
    ".config/waybar/style.css".source = ./dotfiles/waybar.css;
  };
}
