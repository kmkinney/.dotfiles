# Linux only for now
{pkgs, ...}: {
  imports = [
    # AGS not working
    # ./modules/ags
    ./modules/chrome.nix
    ./modules/font.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/gtk
    ./modules/hyprland
    ./modules/neovim.nix
    ./modules/terminal
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  # Standalone packages
  home.packages = with pkgs; [
    # Packages needed from nixos
    # act
    alejandra
    # awscli2
    # biome
    btop
    # cargo
    chromium
    claude-code
    code-cursor
    codex
    cue
    curl
    discord
    # doppler
    # firebase-tools
    # firefox
    gcc
    git
    htop
    insomnia
    killall
    # lm_sensors
    mariadb.client
    ngrok
    nodePackages_latest.pnpm
    nodePackages_latest.prisma
    nodePackages_latest.vercel
    nodejs
    obs-studio
    openssl
    pscale
    python3
    ripgrep
    slack
    tldr
    tree
    unzip
    vim
    vscode
    wget
  ];
}
