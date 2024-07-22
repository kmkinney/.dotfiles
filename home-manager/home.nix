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
    ranger
    btop

    nodejs_20
    nodePackages.pnpm
    rust-analyzer

    # Custom scripts
    (import ../scripts/dotfiles.nix {inherit pkgs;})
  ];
  programs.home-manager.enable = true;

  imports = [
    ./modules/neovim.nix
    ./modules/hyprland
    ./modules/terminal
    ./modules/git.nix
    ./modules/vscode.nix
    ./modules/ranger.nix
  ];
}
