{pkgs, ...}: {
  # nice, this styles gdm too!
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ../../wallpapers/cabin.jpg;

    targets = {
      chromium.enable = false;
    };
  };
}
