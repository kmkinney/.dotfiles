# Which modules to use for the macos system
{pkgs, ...}: {
  home.packages = with pkgs; [
    claude-code
  ];
}
