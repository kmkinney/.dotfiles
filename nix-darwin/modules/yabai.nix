{...}: {
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";
    };
  };

  services.skhd = {
    enable = true;
    skhdConfig = ''
      # cmd - j : yabai -m window --focus south
      # cmd - k : yabai -m window --focus north
      # cmd - h : yabai -m window --focus west
      # cmd - l : yabai -m window --focus east

      # cmd - return: /etc/profiles/per-user/kevin/bin/kitty
    '';
  };
}
