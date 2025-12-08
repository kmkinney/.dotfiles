{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
    # ./bash.nix
    ./zellij.nix
    ./tmux.nix
    ./yazi.nix
    ./wezterm.nix
    ./zoxide.nix
    ./lazydocker.nix
  ];

  # Default terminal tools
  home.packages = with pkgs; [
    btop
    curl
    gcc
    htop
    killall
    net-tools
    tldr
    tree
    unzip
    wget
  ];
}
