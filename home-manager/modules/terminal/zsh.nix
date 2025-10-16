{pkgs, ...}: {
  # Programs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=4";
    };
    shellAliases = {
      avante = "nvim -c \"lua vim.defer_fn(function()require(\\\"avante.api\\\").zen_mode()end, 100)\"";
      v = "nvim";
      ll = "ls -alF";
      lg = "lazygit";
      py = "python3";
      zj = "zellij";
      yz = "yazi";
      nr = "nixosbuild";
      dr = "sudo darwin-rebuild switch --flake ~/.dotfiles/nix-darwin";

      killport = "f() { sudo kill -9 $(sudo ${pkgs.lsof}/bin/lsof -t -i:$1 2>/dev/null) && echo \"Killed process on port $1\" || echo \"No process found on port $1\"; }; f";

      # Work aliases
      lid = "hyprctl keyword monitor \"eDP-1,disable\"";
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
