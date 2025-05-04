{
  pkgs,
  system,
  ...
}:
pkgs.writeShellScriptBin "nixosbuild" ''
  echo "Rebuilding nixos"
  sudo ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake ~/.dotfiles#nixos-${system}
''
