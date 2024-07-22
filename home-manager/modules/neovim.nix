{config, ...}: let
  configDir = "${config.home.homeDirectory}/.dotfiles";
  nvimDir = "${configDir}/home-manager/dotfiles/nvim";
in {
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  home.file = {
    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimDir;
  };
}
