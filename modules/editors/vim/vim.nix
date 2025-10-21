{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    vim 
  ];

  programs.vim = {
    enable = true;
    
    # --- Basic Vim Settings ---
    settings = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      number = true;
      syntax = "on";
      
      # Enable filetype detection
      filetype = "plugin indent on";
    };

    # --- Custom .vimrc commands ---
    extraConfig = ''
      " Custom mapping to quickly save file
      nnoremap <leader>w :w<CR>

      " Set dark colorscheme
      colorscheme default
    '';
  };
}
