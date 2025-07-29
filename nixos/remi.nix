# Started from https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix
# NIXOS Root Config
{pkgs, ...}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";

  # Firmware update
  services.fwupd.enable = true;

  # Nixos configuration
  imports = [
    # Kevin's modules
    ./modules/bluetooth.nix
    ./modules/hyprland.nix
    ./modules/networking.nix
    ./modules/pipewire.nix
    ./modules/stylix.nix
    ./modules/virt.nix
    ./modules/webdev.nix
    ./modules/obs.nix

    # Nixos scripts
    ./scripts

    # Hardware configs
  ];

  # Custom options for hardware
  nixos.kevin = {
    scripts.enable = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users.kevin = {
    # initialPassword = "nix";
    description = "Kevin";
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # NixOS System Packages
  environment.systemPackages = with pkgs; [
    # Basic
    git
    gparted
    htop
    killall
    lm_sensors
    tldr
    tree
    unzip
    vim
    wget

    # Lang
    cargo
    curl
    gcc
    python3

    # Browsers
    firefox
    google-chrome

    # Work
    slack
    code-cursor
    vscode

    home-manager
  ];

  # Security
  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
