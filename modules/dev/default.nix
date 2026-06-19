{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    gnumake
    jdk21_headless
    nodejs_22
  ];
}
