{pkgs, ...}: {
  # Ensure packages are available in the system environment
  environment.systemPackages = with pkgs; [
    hypridle
    swaylock-fancy
    brightnessctl
  ];

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
          timeout = 180;
          on-timeout = "brightnessctl -s set 15%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 350;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 420;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
