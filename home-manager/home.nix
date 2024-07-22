{
  pkgs,
  system,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "kevin";
  home.homeDirectory =
    if system == "x86_64-linux"
    then "/home/kevin"
    else "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    alejandra
    kitty
    ranger
    btop

    nodejs_20
    nodePackages.pnpm
    rust-analyzer

    # Custom scripts
    (import ../scripts/dotfiles.nix {inherit pkgs;})
  ];
  programs.home-manager.enable = true;
  programs.vscode.enable = true;

  imports = [
    # (import ./modules/neovim.nix {inherit config;})
    ./modules/neovim.nix
    ./modules/hyprland
    ./modules/terminal
    ./modules/git.nix
  ];

  # Dotfiles using their own files
  home.file = {
    ".tmux.conf".source = ./dotfiles/tmux.conf;
  };
}
