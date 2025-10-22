{ config, pkgs, lib, inputs, ... }:

{
  # import hyprland url

  home.packages = with pkgs; [
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
