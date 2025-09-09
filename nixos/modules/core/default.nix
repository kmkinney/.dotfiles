{...}: {
  # These modules are used regardless of what DE is chosen
  # Don't have options associated with them
  imports = [
    ./applications.nix
    ./bluetooth.nix
    ./boot.nix
    ./font.nix
    ./networking.nix
    ./nix-settings.nix
    ./pipewire.nix
    ./printers.nix
  ];
}
