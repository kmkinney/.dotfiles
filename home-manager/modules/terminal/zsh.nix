{...}: {
  # Programs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      v = "nvim";
      ll = "ls -alF";
      lg = "lazygit";
      py = "python3";
      zj = "zellij";
      hms = "home-manager switch --flake ~/.dotfiles/home-manager#linux";
    };
    oh-my-zsh = {
      enable = true;
      theme = "awesomepanda";
      plugins = [
        "git"
      ];
    };
  };
}
