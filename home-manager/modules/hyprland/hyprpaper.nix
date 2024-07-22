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
        "DP-4,${cabin}"
        "DP-3,${cabin}"
        "DP-2,${cabin}"
        "DP-1,${cabin}"
        "eDP-1,${cabin}"
      ];
    };
  };
}
