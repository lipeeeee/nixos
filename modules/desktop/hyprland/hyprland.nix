{ config, pkgs, lib, inputs, ... }:

{
  # programs.hyprland.enable = true; # this should be here but homemanager doesnt support it

  home.packages = with pkgs; [
    wl-clipboard
    hyprpicker
    kitty
  ];

  home.file.".config/hypr" = {
    target = ".config/hypr"; 
    source = ./config; 
    recursive = true;
    force = true;
  };

  # linking misc stuff
  home.file.".icons" = {
    target = ".icons";
    source = ./icons;
    recursive = true;
    force = true;
  };
}
