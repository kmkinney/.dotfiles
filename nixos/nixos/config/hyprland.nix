{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    dunst
    hyprpaper
    xdg-desktop-portal-hyprland
    waybar
    wofi
  ];
}
