{pkgs, ...}: {
  # home.packages = with pkgs; [
  #   gnomeExtensions.dash-to-dock
  # ];
  home.file.".local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com".source = builtins.fetchGit {
    url = "https://github.com/micheleg/dash-to-dock.git";
  };
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
