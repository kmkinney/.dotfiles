{ pkgs, ... }: {
  users.users.kevin = {
    name = "kevin";
    home = "/Users/kevin";
  };
  environment.systemPackages = with pkgs; [
    vim
    tmux
    kitty
  ];
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";

  nix.extraOptions = ''
    extra-platforms = aarch64-darwin x86_64-darwin
    experimental-features = nix-command flakes
  '';
  programs.zsh.enable = true;
  system.stateVersion = 4;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # System settings
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };
  system.starup.chime = false;
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain = {
    AppleShowAllFiles = true;
    # InitialKeyRepeat = 0;
    # KeyRepeat = 0;
  };
}
