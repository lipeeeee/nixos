{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session"; # Lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
  
      listener = [ # timeout supposedly uses *seconds* but its BS
        {
          timeout = 3000;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 3300;
          on-timeout = "hyprctl dispatch dpms off"; # Turn off screen
          on-resume = "hyprctl dispatch dpms on";   # Turn on screen
        }
        {
          timeout = 3600;
          on-timeout = "systemctl suspend"; # Suspend PC
        }
      ];
    };
  };
}
