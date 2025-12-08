{pkgs, ...}: {
  home.packages = with pkgs; [
    _1password-gui
    discord
    obs-studio
    slack
  ];
}
