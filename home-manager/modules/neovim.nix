{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/.dotfiles";
  nvimDir = "${configDir}/home-manager/dotfiles/nvim";
  diyDir = "${configDir}/home-manager/dotfiles/nvim-diy";
in {
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  home.packages = with pkgs; [
    # LSPs
    lua-language-server
    nixd
    stylua
    typescript-go
    gnumake
  ];

  programs.zsh.shellAliases = {
    vim = "nvim";
    nvimd = "NVIM_APPNAME=\"nvim-diy\" nvim";
  };

  home.file = {
    # This is to allow lazy-lock.json to be writable
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimDir;
    # Trying out my own config
    ".config/nvim-diy".source = config.lib.file.mkOutOfStoreSymlink diyDir;
  };
}
