{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/.dotfiles";
  nvimDir = "${configDir}/home-manager/dotfiles/nvim";
in {
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  home.packages = with pkgs; [
    # LSPs
    lua-language-server
  ];

  home.file = {
    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimDir;
  };
}
