{...}: {
  programs = {
    wezterm = {
      enable = true;
      extraConfig =
        /*
        lua
        */
        ''
          return {
            font = wezterm.font("JetBrains Mono"),
            color_scheme = 'Everforest Dark Hard (Gogh)',
            enable_tab_bar = false,
            enable_wayland = true
          }
        '';
    };
  };
}
