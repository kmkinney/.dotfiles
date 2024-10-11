# Which modules to use for the linux system
{pkgs, ...}: {
  imports = [
    ../modules/git.nix
    ../modules/gtk
    ../modules/hyprland
    ../modules/ags
    ../modules/neovim.nix
    ../modules/ranger.nix
    ../modules/terminal
    ../modules/gnome.nix
  ];

  # Standalone packages
  home.packages = with pkgs; [
    alejandra
    ripgrep
    btop

    nodejs_20
    nodePackages.pnpm
    # rust-analyzer
  ];
}
