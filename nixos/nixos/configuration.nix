# Started from https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix
# NIXOS Root Config
{pkgs, ...}: {
  # Nixos configuration
  imports = [
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

  # System config
  networking.hostName = "kmkinney-nixos";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users.kevin = {
    initialPassword = "nix";
    description = "kevin";
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      zsh
      kitty
      neofetch
      lazygit
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    htop
    tmux
    tree
    cargo
    rustc
    home-manager
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Programs

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.hyprland = {
    enable = true;
  };

  # GDM
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}