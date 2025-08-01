{...}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        # Lock comand to use
        lock_cmd = "pidof swaylock-fancy || swaylock-fancy";
        # Wake up the screen
        after_sleep_cmd = "hyprctl dispatch dpms on";

        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
