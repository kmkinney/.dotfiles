{...}: {
  # Programs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=4";
    };
    shellAliases = {
      v = "nvim";
      ll = "ls -alF";
      lg = "lazygit";
      py = "python3";
      zj = "zellij";
      yz = "yazi";
      hms = "home-manager switch --flake ~/.dotfiles/home-manager#linux";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos";
      dr = "darwin-rebuild switch --flake ~/.dotfiles/nix-darwin";
    };
    oh-my-zsh = {
      enable = true;
      theme = "awesomepanda";
      plugins = [
        "git"
      ];
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
