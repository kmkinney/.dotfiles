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
    xdg-desktop-portal-hyprland
    waybar
    wofi
  ];
}
