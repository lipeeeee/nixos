{ config, pkgs, lib, inputs, ... }:

{
  # import hyprland url
  imports = [ inputs.hyprland.homeManagerModules.default ];

  programs.hyprland.enable = true;
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
