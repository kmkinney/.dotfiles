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
    terraform
    tldr
    tree
    unzip
    wget
  ];

  # home.sessionPath = [
  #   "$HOME/.bun/bin"
  #   "$HOME/.opencode/bin"
  #   "$HOME/.local/bin"
  #   "$HOME/.git-ai/bin"
  # ];
  #
  # home.sessionVariables = {
  #   BUN_INSTALL = "$HOME/.bun";
  # };
}
