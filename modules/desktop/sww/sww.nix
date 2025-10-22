{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];

  home.file.".config/waybar" = {
    target = ".config/waybar";
    source = ./config;
    recursive = true;
    force = true;
  };
}
