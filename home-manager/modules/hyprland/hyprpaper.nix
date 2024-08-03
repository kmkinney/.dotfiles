{config, ...}: let
  wallpaperDir = "${config.home.homeDirectory}/.dotfiles/wallpapers";
  cabin = "${wallpaperDir}/cabin.jpg";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = ["${cabin}"];
      wallpaper = [
        ",${cabin}"
      ];
    };
  };
}
