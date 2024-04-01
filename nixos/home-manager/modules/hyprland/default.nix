{...}: {
  # Dotfiles for hyprland and related configs
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/dunst/dunstrc".source = ./dunstrc.cfg;
  home.file.".config/waybar/config".source = ./waybar.jsonc;
  home.file.".config/waybar/style.css".source = ./waybar.css;
}
