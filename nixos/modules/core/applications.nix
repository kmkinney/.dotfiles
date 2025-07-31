# My favorite graphical apps
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Disk management
    gparted
    gnome-disk-utility
    gnome-usage
    nautilus

    # systm monitoring
    gnome-system-monitor
  ];
}
