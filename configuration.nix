{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    tmux
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
}