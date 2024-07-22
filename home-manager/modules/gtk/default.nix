# https://www.youtube.com/watch?v=m_6eqpKrtxk
{pkgs, ...}: let
  everforest-dark = import ./everforest-dark.nix {inherit pkgs;};
in {
  gtk.enable = true;
  gtk.theme = {
    name = "Everforest-Dark-BL";
    package = everforest-dark;
  };
}
