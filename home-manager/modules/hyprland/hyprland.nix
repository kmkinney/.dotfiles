{
  # inputs,
  pkgs,
  ...
}: let
  # hyprland-pkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
  # dark_green = "rgba(3c4841ff)";
  green = "rgba(A7C080ff)";
  gray = "rgba(343F44ff)";

  # This way we can avoid using a command that is not installed
  cmd = pkgName: "${pkgs.${pkgName}}/bin/${pkgName}";
in {
  home.packages = with pkgs; [
    dunst
    grimblast
    hyprpicker
    waybar
    wl-clipboard
    wofi
    xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # package = null;
    # portalPackage = null;

    # TODO: https://bobbys.zone/guides/hyprland-clamshell

    # plugins = [
    #   hyprland-pkgs.hyprbars
    # ];

    settings = {
      # Variables
      "$mod" = "SUPER";
      "$modshift" = "SUPERSHIFT";
      "$terminal" = "kitty";

      debug = {
        disable_logs = false;
      };
      # Monitors
      monitor = [
        "desc:HP Inc. HP 24mh 3CM2050HPH,1920x1080,0x0,1"
        "desc:LG Electronics LG TV SSCR2 0x01010101,4096x2160,0x0,2"
        "desc:LG Electronics LG Ultra HD 0x00027BFE,1920x1080,0x0,1"
        # Work monitor
        "desc:LG Electronics LG HDR 4K,preferred,0x0,1.666667"
        "DP-3,preferred,auto,1.666667"
        "DP-4,preferred,auto-left,1.666667"
      ];

      # Startup
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dunst"
        "hypridle"
      ];

      exec = [
        "nm-applet --indicator"
        "blueman-applet"
        "hyprpaper"
        "dunstify \"Config reloaded\""
        "pkill waybar; waybar"
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

      # windowrule = [
      #   "center on,title:pavucontrol"
      #   "float on,title:pavucontrol"
      #   "float on,title:blueman"
      #   "center on,title:blueman"
      #   "center on,title:NordPass"
      # ];

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

      gesture = [
        "3, horizontal, workspace"
        # a couple of handy examples you can keep or delete:
        # "3, up, dispatcher, exec, wofi --show drun"
        # "3, down, dispatcher, exec, kitty"
        # "4, horizontal, special" # open/close special workspace with 4 fingers
        # "3, left, dispatcher, movefocus, l"
        # "3, right, dispatcher, movefocus, r"
      ];

      misc = {
        disable_hyprland_logo = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      binds = {
        allow_workspace_cycles = true;
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
        # Config management
        "$modshift, B, exec, pkill waybar; waybar &"
        "$modshift, W, exec, pkill hyprpaper; hyprpaper &"
        "$modshift, R, exec, hyprctl reload"

        # Applications
        "$mod, E, exec, ${cmd "nautilus"}"
        "$mod, B, exec, ${cmd "firefox"}"
        "$mod, S, exec, ${cmd "steam"}"
        "$mod, G, exec, google-chrome-stable"

        # Session management
        "$mod, Delete, exec, ${cmd "hyprlock"}"
        "$modshift, Delete, exec, shutdown now"

        # Screenshots
        ",Print, exec, ${cmd "grimblast"} --notify copysave screen"
        "$mod, P, exec, ${cmd "grimblast"} --notify copysave area"
        "$mod, Print, exec, ${cmd "grimblast"} --notify copysave area"
        "$modshift, P, exec, ${cmd "hyprpicker"} | tr -d '\\n' | wl-copy"

        # Brightness and volume
        ",XF86MonBrightnessUp,exec,${cmd "brightnessctl"} s +20%"
        ",XF86MonBrightnessDown,exec,${cmd "brightnessctl"} s 20%-"
        ",XF86AudioRaiseVolume,exec,${cmd "pamixer"} -i 5"
        ",XF86AudioLowerVolume,exec,${cmd "pamixer"} -d 5"
        ",XF86AudioMute,exec,${cmd "pamixer"} -t"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioNext,exec,playerctl play-pause"

        # Window management
        "$mod, F, fullscreen"
        "$modshift, j, togglesplit"
        "$modshift, k, swapsplit"

        # Workspaces
        "$modshift, h, workspace, e-1"
        "$modshift, l, workspace, e+1"
        "CONTROL SHIFT, h, workspace, e-1"
        "CONTROL SHIFT, l, workspace, e+1"
        "$mod, left, workspace, e-1"
        "$mod, right, workspace, e+1"
        "$mod, TAB, workspace, previous"
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
        "$modshift, 1, movetoworkspace, 1"
        "$modshift, 2, movetoworkspace, 2"
        "$modshift, 3, movetoworkspace, 3"
        "$modshift, 4, movetoworkspace, 4"
        "$modshift, 5, movetoworkspace, 5"
        "$modshift, 6, movetoworkspace, 6"
        "$modshift, 7, movetoworkspace, 7"
        "$modshift, 8, movetoworkspace, 8"
        "$modshift, 9, movetoworkspace, 9"
        "$modshift, 0, movetoworkspace, 10"
        "$modshift, left, movecurrentworkspacetomonitor, l"
        "$modshift, right, movecurrentworkspacetomonitor, r"
      ];
    };
  };
}
