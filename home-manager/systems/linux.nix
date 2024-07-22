# Which modules to use for the linux system
{...}: {
  imports = [
    ./modules/neovim.nix
    ./modules/hyprland
    ./modules/terminal
    ./modules/git.nix
    ./modules/ranger.nix
  ];
}
