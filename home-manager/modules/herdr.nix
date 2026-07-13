{...}: {
  programs.herdr = {
    enable = true;
    # package managed by `herdr update` / `herdr channel set` (not yet in nixpkgs)
    package = null;
    settings = {
      onboarding = false;

      terminal.default_shell = "zsh";

      keys = {
        prefix = "ctrl+g";
        goto = "prefix+space";
        split_vertical = "prefix+\\";
        split_horizontal = "prefix+minus";
        command = [
          {
            key = "prefix+shift+w";
            type = "pane";
            command = "remi-new";
            description = "new roofworx worktree + claude";
          }
        ];
      };

      theme = {
        name = "terminal";
        # everforest-dark-medium palette, ported from zellij.nix
        custom = {
          panel_bg = "#2f383e";
          accent = "#a7c080";
          green = "#a7c080";
          blue = "#7fbbb3";
          red = "#d6494d";
          yellow = "#dbbc7f";
        };
      };

      ui = {
        agent_panel_sort = "spaces";
        toast.delivery = "system";
        sound.enabled = false;
      };
    };
  };
}
