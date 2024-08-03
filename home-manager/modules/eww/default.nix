{config, ...}: let
  configDir = "${config.home.homeDirectory}/.dotfiles/home-manager/modules/eww";
in {
  programs.eww = {
    enable = true;
    configDir = configDir;
  };
}
