{
  config,
  pkgs,
  ...
}: {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    git
    kitty
  ];
  programs.home-manager.enable = true;

  # Dotfiles
  imports = [
    ./config/kitty.nix
    ./config/git.nix
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kevin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
