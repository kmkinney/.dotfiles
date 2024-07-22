# Which modules to use for the linux system
{pkgs, ...}: {
  imports = [
    ../modules/git.nix
    ../modules/gtk.nix
    ../modules/hyprland
    ../modules/neovim.nix
    ../modules/ranger.nix
    ../modules/terminal
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
