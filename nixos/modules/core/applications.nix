# My favorite graphical apps
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Disk / file management
    gparted
    gnome-disk-utility
    gnome-usage

    # Files and media
    nautilus
    vlc

    # systm monitoring
    gnome-system-monitor

    # Productivity
    obsidian
  ];
}
