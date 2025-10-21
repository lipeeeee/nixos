{ config, pkgs, lib, ... }:

{
  programs.vim = {
    enable = true;
  };

  home.file.".vimrc" = {
    # Destination: ~/.vimrc
    target = ".vimrc"; 
    
    source = ./.vimrc; 
    
    # Tell Home Manager to create a symlink (default is copy, but symlink is common)
    # The default is generally sufficient, but you can be explicit:
    # recursive = false;
    # executable = false;
  };
}
