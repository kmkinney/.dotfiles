{
  pkgs,
  config,
  homeDirectory,
  ...
}: let
  configDir = "${config.home.homeDirectory}/.dotfiles/nixos/home-manager";
in {
  home.username = "kevin";
  home.homeDirectory = homeDirectory;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    neovim
    git
    kitty
    ranger
    (import ./dotfiles.nix {inherit pkgs;})
  ];
  programs.home-manager.enable = true;

  # Dotfiles using nix
  imports = [
    ./config/ranger.nix
    ./config/kitty.nix
    ./config/git.nix
  ];

  # Dotfiles using their own files
  home.file = {
    ".zshrc".source = ./config/zshrc.zsh;
    ".tmux.conf".source = ./config/tmux.conf;
    ".p10k.zsh".source = ./config/p10k.zsh;
    ".config/hypr/hyprland.conf".source = ./config/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;
    ".config/dunst/dunstrc".source = ./config/dunstrc.cfg;
    ".config/waybar/config".source = ./config/waybar.jsonc;
    ".config/waybar/style.css".source = ./config/waybar.css;

    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/config/nvim";
  };
}
