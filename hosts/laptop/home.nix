{ config, pkgs, inputs, lib, ... }:

let 
  moduleRoot = ../../modules;
  M = path: import "${moduleRoot}/${path}";
in
{
  home.username = "lipe";
  home.homeDirectory = "/home/lipe";
  home.stateVersion = "25.05";

  imports = [
    (M "editors/vim/vim.nix")

    (M "desktop/hyprland/hyprland.nix")
    (M "desktop/waybar/waybar.nix")
    (M "desktop/tofi/tofi.nix")
    (M "desktop/mako/mako.nix")
    (M "desktop/swww/swww.nix")

    (M "system/fonts.nix")
  ];

  home.packages = with pkgs;[ # TODO: these packages should go to their own modules if poss
    tree
    htop
    gcc
    cmatrix
    hyprpicker
    flameshot
    cliphist

    #audio
    playerctl
    wiremix
    pulseaudio
  ];

  home.sessionVariables = { };

  # Setup userdirs we create (prob not worth dividing this into a module)
  xdg.userDirs = {
    enable = true;
    createDirectories = true; 
    
    pictures = "${config.home.homeDirectory}/Pictures"; 
    download = "${config.home.homeDirectory}/Downloads"; 

    # do not create these
    desktop = null;
    documents = null;
    music = null;
    templates = null;
    videos = null;
    publicShare = null;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
