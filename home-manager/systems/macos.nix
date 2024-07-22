# Which modules to use for the macos system
{...}: {
  imports = [
    ./modules/neovim.nix
    ./modules/terminal
    ./modules/git.nix
    ./modules/vscode.nix
  ];
}
