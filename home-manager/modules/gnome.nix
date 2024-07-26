{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    desktop-icons-ng-ding
  ];
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        # dock-from-dash.extensionUuid
        dash-to-dock.extensionUuid
        desktop-icons-ng-ding.extensionUuid
      ];
    };
    settings."org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
    };
  };
}
