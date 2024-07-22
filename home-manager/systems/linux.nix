# Which modules to use for the linux system
{...}: {
  imports = [
    ./modules/neovim.nix
    ./modules/hyprland
    ./modules/terminal
    ./modules/git.nix
    ./modules/ranger.nix
  ];

  # Standalone packages
  home.packages = with pkgs; [
    alejandra
    btop

    nodejs_20
    nodePackages.pnpm
    rust-analyzer
  ];
}
