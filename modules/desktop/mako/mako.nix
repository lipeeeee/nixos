{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    mako 
    libnotify 
  ];

  home.file.".config/mako" = {
    target = ".config/mako";
    source = ./config;
    recursive = true;
    force = true;
  };
}
