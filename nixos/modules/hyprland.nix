{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
  };

  # GDM
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dunst
    hyprpaper
    hyprlock
    hyprpicker
    xdg-desktop-portal-hyprland
    waybar
    wofi
    wl-clipboard
  ];
}
