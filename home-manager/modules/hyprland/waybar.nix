{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        spacing = 4;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "battery"
          "clock"
        ];
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          on-click = "activate";
          format = "{name}";
          on-scroll-up = "hyprctl dispatch workspace m-1 > /dev/null";
          on-scroll-down = "hyprctl dispatch workspace m+1 > /dev/null";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            focused = "";
            default = "";
          };
        };
        "hyprland/window" = {
          separate-outputs = true;
        };
        "hyprland/submap" = {
          max-length = 8;
          tooltip = false;
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          spacing = 0;
        };
        clock = {
          timezone = "America/Denver";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%I:%M %p}";
          format-alt = "{:%B %d, %Y}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󱐋";
          format-plugged = "{capacity}% 󱐋";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "killall pavucontrol || pavucontrol";
        };
      };
    };
  };
}
