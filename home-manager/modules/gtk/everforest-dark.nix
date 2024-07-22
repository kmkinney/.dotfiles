# Simple way to host the built theme myself
# For a better way, try this patter https://github.com/NixOS/nixpkgs/blob/63d37ccd2d178d54e7fb691d7ec76000740ea24a/pkgs/data/themes/matcha/default.nix#L69
{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "everforest-dark";

  src = pkgs.fetchurl {
    url = "https://github.com/kmkinney/.dotfiles/raw/15612d55917d5214eecedf555c54b0cfc9b12bce/home-manager/modules/gtk/Everforest-Dark-BL.zip";
    sha256 = "sha256-hhNfPBs2YYS/PpIxjt6MEeNyztT6eSt1Z1LksGSelcQ=";
    # sha256 = pkgs.lib.fakeSha256;
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/themes
    ${pkgs.unzip}/bin/unzip $src -d $out/share/themes/
  '';
}
