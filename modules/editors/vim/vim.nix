{ config, pkgs, lib, ... }:

{
  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  home.packages = with pkgs; [
    vim
  ];

  home.file.".vimrc" = {
    target = ".vimrc"; 
    source = ./config/.vimrc; 
  };
}
