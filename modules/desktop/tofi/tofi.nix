{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    tofi 
  ];

  home.file.".config/tofi" = {
    target = ".config/tofi";
    source = ./config;
    recursive = true;
    force = true;
  };
}
