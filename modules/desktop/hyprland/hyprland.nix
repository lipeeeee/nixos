{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
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
