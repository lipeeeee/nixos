{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;
  home.packages = with pkgs; [
    kitty
    wofi
  ];

  home.file.".config/hypr" = {
    target = ".config/hypr"; 
    source = ./config; 
    recursive = true;
  };
}
