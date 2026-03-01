{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
  ];

  home.file.".config/hypr/hyprlock.conf" = {
    target = ".config/hypr/hyprlock.conf";
    source = ./hyprlock.conf;
    force = true;
  };
}
