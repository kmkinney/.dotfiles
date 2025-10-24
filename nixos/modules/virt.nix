{pkgs, ...}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  users.users.kevin.extraGroups = ["libvirtd"];

  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    transmission_4-gtk
    virt-viewer
    #virtio-win
    #win-spice
  ];
  programs.virt-manager.enable = true;
}
