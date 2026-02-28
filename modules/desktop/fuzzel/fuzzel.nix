{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
  ];

  home.file.".config/fuzzel" = {
    target = ".config/fuzzel";
    source = ./config;
    recursive = true;
    force = true;
  };
}
