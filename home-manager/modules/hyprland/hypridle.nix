{...}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        # Lock comand to use
        lock_cmd = "pidof swaylock-fancy || swaylock-fancy";
        # Wake up the screen
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 10;
          on-timeout = "notify-send 'Test (10 seconds)'";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
