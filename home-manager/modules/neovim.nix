{config, ...}: let
  configDir = "${config.home.homeDirectory}/.dotfiles";
in {
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  home.file = {
    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${configDir}/nvim";
  };
}
