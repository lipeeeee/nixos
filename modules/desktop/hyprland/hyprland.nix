{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprland
    kitty
    wofi
  ];

  home.file.".config/hypr" = {
    target = ".config/hypr"; 
    source = ./config; 
    recursive = true;
    force = true;
  };
}
