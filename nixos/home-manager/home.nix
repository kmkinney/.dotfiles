{
  pkgs,
  config,
  ...
}: let
  configDir = "${config.home.homeDirectory}/.dotfiles/nixos/home-manager";
in {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    neovim
    git
    kitty
    (import ./dotfiles.nix {inherit pkgs;})
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
    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/config/nvim";
  };
}
