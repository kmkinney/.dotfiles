{...}: {
  # These modules are used regardless of what DE is chosen
  # Don't have options associated with them
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./networking.nix
    ./nix-settings.nix
    ./pipewire.nix
  ];
}
