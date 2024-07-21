{
  pkgs,
  system,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
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
  programs.vscode.enable = true;

  imports = [
    (import ./modules/neovim.nix {inherit config;})
    ./modules/hyprland
    ./modules/terminal
    # ./modules/git
  ];

  # Dotfiles using their own files
  home.file = {
    ".bash_aliases".source = ./dotfiles/bash_aliases.sh;
    ".bashrc".source = ./dotfiles/bashrc.sh;
    ".bash_profile".text = "[ -f ~/.bashrc ] && . ~/.bashrc";
    # ".gitconfig".source = ./dotfiles/gitconfig.conf;
    ".tmux.conf".source = ./dotfiles/tmux.conf;
  };
}
