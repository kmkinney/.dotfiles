{...}: {
  # These modules are used regardless of what DE is chosen
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./networking.nix
    ./pipewire.nix
  ];
}
