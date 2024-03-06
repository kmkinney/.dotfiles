# Started from https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix
# NIXOS Root Config
{pkgs, ...}: {
  # Nixos configuration
  imports = [
    ./modules/bluetooth.nix
    ./modules/hyprland.nix
    ./modules/networking.nix
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users.kevin = {
    initialPassword = "nix";
    description = "kevin";
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    # shell = pkgs.zsh;
  };

  # NixOS System Packages
  environment.systemPackages = with pkgs; [
    cargo
    curl
    gcc
    git
    firefox
    home-manager
    htop
    killall
    rustc
    tmux
    tree
    vim
    wget

    # Custom packages
    (import ../scripts/nixconfig.nix {inherit pkgs;})
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Programs
  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
