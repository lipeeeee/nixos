{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    playerctl
    wiremix
    pulseaudio
  ];
}
