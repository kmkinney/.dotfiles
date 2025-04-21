# Which modules to use for the macos system
{pkgs, ...}: {
  imports = [
    ../modules/neovim.nix
    ../modules/terminal
    ../modules/git.nix
    ../modules/vscode.nix
  ];

  home.packages = with pkgs; [
    alejandra
    pscale
    ripgrep
    nerd-fonts.jetbrains-mono

    nodejs_20
    corepack
  ];
}
