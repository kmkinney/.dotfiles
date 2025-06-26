# Started from https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix
# NIXOS Root Config
{
  pkgs,
  system,
  ...
}: {
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";

  # Nixos configuration
  imports = [
    # Kevin's modules
    ./modules/bluetooth.nix
    ./modules/gaming.nix
    ./modules/gnome.nix
    ./modules/hyprland.nix
    ./modules/networking.nix
    ./modules/pipewire.nix
    ./modules/printers.nix
    ./modules/stylix.nix
    ./modules/virt.nix
    ./modules/webdev.nix

    # Nixos scripts
    ./scripts

    # Hardware configs
    ./hardware/lenovo-laptop.nix
    ./hardware/pc.nix
  ];

  # Custom options for hardware
  nixos.kevin = {
    pc.enable = system == "pc";
    laptop.enable = system == "laptop";

    gaming.enable = true;
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
    cargo
    curl
    firefox
    gcc
    gparted
    git
    google-chrome
    home-manager
    htop
    killall
    python3
    tree
    tldr
    unzip
    vim
    wget
    lm_sensors

    # Custom scripts
    # Custom packages
    # (import ./scripts/nixconfig.nix {inherit pkgs;})
    # (import ./scripts/nixosbuild.nix {inherit pkgs;})
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
