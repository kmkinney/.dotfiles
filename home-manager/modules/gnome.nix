{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
  ];
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        "dash-to-dock@micxgx.gmail.com"
      ];
    };
    settings."org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
    };
  };
}
