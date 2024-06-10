{
  pkgs,
  system,
  config,
  ...
}: {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    git
    gh
    pscale
    lazygit
    ripgrep
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    nodejs_20
    nodePackages.pnpm
  ];
  programs.home-manager.enable = true;
  programs.vscode.enable = true;

  imports = [
    (import ./modules/neovim.nix {inherit config;})
    ./modules/terminal
  ];

  # Dotfiles using their own files
  home.file = {
    ".bash_aliases".source = ./dotfiles/bash_aliases.sh;
    ".bashrc".source = ./dotfiles/bashrc.sh;
    ".bash_profile".text = "[ -f ~/.bashrc ] && . ~/.bashrc";
    ".gitconfig".source = ./dotfiles/gitconfig.conf;
    ".zshrc".source = ./dotfiles/zshrc.zsh;
    ".tmux.conf".source = ./dotfiles/tmux.conf;
    ".p10k.zsh".source = ./dotfiles/p10k.zsh;
  };
}
