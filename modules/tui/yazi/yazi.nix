{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    yazi
  ];

  home.file.".config/yazi" = {
    target = ".config/yazi";
    source = ./config;
    recursive = true;
    force = true;
  };
}
