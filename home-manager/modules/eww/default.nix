{pkgs, ...}: {
  programs.eww = {
    enable = true;
    configDir = ./config;
  };

  home.packages = with pkgs; [
    pamixer
    (import ./scripts/simple.nix {inherit pkgs;})
  ];
}
