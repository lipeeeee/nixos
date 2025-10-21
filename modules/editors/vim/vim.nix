{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vim
  ];

  home.file.".vimrc" = {
    target = ".vimrc"; 
    source = ./.vimrc; 
  };
}
