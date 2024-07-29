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
    skipConfig = ''
      cmd - j : yabai -m window --focus south
      cmd - k : yabai -m window --focus north
      cmd - h : yabai -m window --focus west
      cmd - l : yabai -m window --focus east
    '';
  };
}
