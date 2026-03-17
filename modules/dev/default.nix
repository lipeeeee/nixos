{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    jdk21_headless
    nodejs_22
  ];
}
