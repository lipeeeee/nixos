{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    nodejs_22
  ];
}
