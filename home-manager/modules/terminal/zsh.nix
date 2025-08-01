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
      nr = "nixosbuild";
      dr = "sudo darwin-rebuild switch --flake ~/.dotfiles/nix-darwin";

      # Work aliases
      p = "pnpm";
      dev = "pnpm dev";
      clean = "pnpm clean:all";
    };
    zplug = {
      enable = true;
      plugins = [
        #  "jeffreytse/zsh-vi-mode"
        {
          name = "MichaelAquilina/zsh-you-should-use";
        }

        #  "fdellwing/zsh-bat"
        #  "MichaelAquilina/zsh-auto-notify"
      ];
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
