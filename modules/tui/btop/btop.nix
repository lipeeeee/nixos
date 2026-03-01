{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "custom";
      theme_background = false; 
      vim_keys = true;
      update_ms = 1000;
    };
  };

  home.file.".config/btop/themes/custom.theme" = {
    target = ".config/btop/themes/custom.theme";
    source = ./config/custom.theme;
    force = true;
  };
}
