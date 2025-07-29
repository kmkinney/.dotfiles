{
  inputs,
  pkgs,
  ...
}: let
  hyprland-pkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
  green = "rgba(A7C080ff)";
  gray = "rgba(343F44ff)";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    # plugins = [
    #   hyprland-pkgs.hyprbars
    # ];

    settings = {
      # Variables
      "$mod" = "SUPER";
      "$modshift" = "SUPERSHIFT";
      "$terminal" = "kitty";

      # Monitors
      monitor = [
        "desc:HP Inc. HP 24mh 3CM2050HPH,1920x1080,0x0,1"
        "desc:LG Electronics LG TV SSCR2 0x01010101,4096x2160,0x0,2"
        "desc:LG Electronics LG Ultra HD 0x00027BFE,1920x1080,0x0,1"
      ];

      # Startup
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dunst"
      ];

      exec = [
        "nm-applet --indicator"
        "blueman-applet"
        "hyprpaper"
        "dunstify \"Config reloaded\""
        # "ags -q; ags"
      ];

      # Env
      env = [
        "XCURSOR_SIZE,24"
        "XDG_SCREENSHOTS_DIR,/home/kevin/Pictures/screenshots"
        "QT_QPA_PLATFORM,wayland;xcb"
        "MOZ_ENABLE_WAYLAND,1"
        "OBSIDIAN_USE_WAYLAND,1"
        "GDK_SCALE,1"
        "XCURSOR_SIZE,24"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
      ];

      windowrule = [
        "center,title:pavucontrol"
        "float,title:pavucontrol"
        "float,title:blueman"
        "center,title:blueman"
        "center,title:NordPass"
      ];

      input = {
        kb_layout = "us";
        kb_options = "caps:escape";

        repeat_rate = 50;
        repeat_delay = 250;

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };
        natural_scroll = true;
        # -1.0 - 1.0, 0 means no modification.
        sensitivity = -0.2;
        numlock_by_default = true;
      };

      cursor = {
        inactive_timeout = 30;
      };

      general = {
        gaps_in = 3;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = green;
        "col.inactive_border" = gray;

        layout = "dwindle";
      };

      decoration = {
        rounding = 3;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        # drop_shadow = "yes";
        # shadow_range = 4;
        # shadow_render_power = 3;
        # col.shadow = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "no";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      bindt = [
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, u"
        "$mod, k, movefocus, d"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "ALT, mouse:272, resizewindow"
      ];

      bindd = [
        "$mod, Return,Open kitty, exec, kitty"
        "$mod, C,Close window, killactive, "
        "$mod, M,Logout, exit, "
        "$mod, V,Toggle floating, togglefloating, "
        "$mod, R,Application runner, exec, wofi --show drun"
        "$mod, Space,Application runner, exec, wofi --show drun"
      ];

      bind = [
        "$mod, E, exec, nautilus"
        "$mod, B, exec, firefox"
        "$mod, S, exec, steam"
        "$mod, G, exec, google-chrome-stable"
        "$mod, F, fullscreen"
        "SUPER SHIFT, Delete, exec, shutdown now"
        ",Print, exec, grimblast --notify copysave screen"
        "SUPER, P, exec, grimblast --notify copysave area"
        "$mod, Print, exec, grimblast --notify copysave area"
        "SUPER SHIFT, P, exec, hyprpicker | tr -d '\\n' | wl-copy"
        ",XF86MonBrightnessUp,exec,brightnessctl s +20%"
        ",XF86MonBrightnessDown,exec,brightnessctl s 20%-"
        ",XF86AudioRaiseVolume,exec,pamixer -i 5"
        ",XF86AudioLowerVolume,exec,pamixer -d 5"
        ",XF86AudioMute,exec,pamixer -t"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioNext,exec,playerctl play-pause"
        ",XF86AudioMute,exec,pamixer -t"
        "$mod SHIFT, j, togglesplit"
        "$mod SHIFT, k, swapsplit"
        "$mod SHIFT, h, workspace, e-1"
        "$mod SHIFT, l, workspace, e+1"
        "CONTROL SHIFT, h, workspace, e-1"
        "CONTROL SHIFT, l, workspace, e+1"
        "$mod, left, workspace, e-1"
        "$mod, right, workspace, e+1"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "SUPER SHIFT, B, exec, ags -q; ags"
        "SUPER SHIFT, W, exec, pkill hyprpaper; hyprpaper &"
        "SUPER SHIFT, R, exec, hyprctl reload"
      ];
    };
  };
}
