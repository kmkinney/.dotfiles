{pkgs, ...}: {
  home.packages = with pkgs; [
    pkgs.ags
  ];
}
