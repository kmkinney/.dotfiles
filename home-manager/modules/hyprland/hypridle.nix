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
          timeout = 1;
          on-timeout = "dunstify 'Test (1 seconds)'";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
