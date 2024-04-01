{...}: {
  programs.kitty.enable = true;

  programs.kitty.settings = {
    # FONTS
    font_family = "JetBrainsMono Nerd Font Mono";

    # Everforest Color Scheme
    foreground = "#d8cacc";
    background = "#323d43";
    selection_foreground = "#3c474d";
    selection_background = "#525c62";
    url_color = "#415c6d";
    cursor = "#7fbbb3";
    background_opacity = "0.8";

    # black
    color0 = "#4a555b";
    color8 = "#525c62";

    # red
    color1 = "#e68183";
    color9 = "#e68183";

    # green
    color2 = "#a7c080";
    color10 = "#a7c080";

    # yellow
    color3 = "#dbbc7f";
    color11 = "#dbbc7f";

    # blue
    color4 = "#7fbbb3";
    color12 = "#7fbbb3";

    # magenta
    color5 = "#d699b6";
    color13 = "#d699b6";

    # cyan
    color6 = "#83c092";
    color14 = "#83c092";

    # white
    color7 = "#d8caac";
    color15 = "#d8caac";

    # Annoying bell be gone
    enable_audio_bell = false;
    hide_window_decorations = true;
  };
}
