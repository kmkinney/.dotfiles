{pkgs, ...}: {
  imports = [
    ./modules/yabai.nix
  ];
  users.users.kevin = {
    name = "kevin";
    home = "/Users/kevin";
  };
  environment.systemPackages = with pkgs; [
    fzf
    vim
    kitty
    raycast
    tmux
    ngrok
  ];
  nix.enable = true;
  nix.settings.experimental-features = "nix-command flakes";

  nix.extraOptions = ''
    extra-platforms = aarch64-darwin x86_64-darwin
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  system.stateVersion = 4;
  ids.gids.nixbld = 350;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # System settings
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
  system.startup.chime = false;
  system.defaults.dock.autohide = true;
  system.defaults.finder = {
    AppleShowAllFiles = true;
  };
  # system.defaults.universalaccess.reduceMotion = true;
  system.defaults.NSGlobalDomain = {
    AppleShowAllFiles = true;
    # InitialKeyRepeat = 0;
    # KeyRepeat = 0;
  };

  # homebrew = {
  #   enable = true;
  #   brews = [
  #     "gnu-sed"
  #     "nixpacks"
  #   ];
  #   casks = [
  #     "nordpass"
  #     "steam"
  #     "firefox"
  #     "kitty"
  #     "notion-calendar"
  #     "slack"
  #     "obsidian"
  #     "visual-studio-code"
  #   ];
  # };
}
