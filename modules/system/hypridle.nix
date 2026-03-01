{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Avoid starting multiple instances
        before_sleep_cmd = "loginctl lock-session"; # Lock before suspend
        after_sleep_cmd = "hyprctl dispatch dpms on"; # Turn screen on when waking
      };
  
      listener = [
        {
          timeout = 300; # 5 minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 330; # 5.5 minutes
          on-timeout = "hyprctl dispatch dpms off"; # Turn off screen
          on-resume = "hyprctl dispatch dpms on";   # Turn on screen
        }
        {
          timeout = 1800; # 30 minutes
          on-timeout = "systemctl suspend"; # Suspend PC
        }
      ];
    };
  };
}
