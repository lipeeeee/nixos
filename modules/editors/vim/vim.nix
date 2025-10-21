{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vim 
  ];

  programs.vim = {
    enable = true;
  };
}
