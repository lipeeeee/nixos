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
    (M "editors/neovim.nix")

    (M "desktop/hyprland/hyprland.nix")
    (M "desktop/hyprlock/hyprlock.nix")
    (M "desktop/waybar/waybar.nix")
    (M "desktop/tofi/tofi.nix")
    # (M "desktop/fuzzel/fuzzel.nix")
    (M "desktop/mako/mako.nix")
    (M "desktop/swww/swww.nix")

    (M "apps/spotify.nix")
    (M "apps/brave.nix")
    (M "apps/discord.nix")

    (M "tui/yazi/yazi.nix")
    (M "tui/btop/btop.nix")

    (M "system/fonts.nix")
    (M "system/bash.nix")
    (M "system/audio.nix")
    (M "system/hypridle.nix")

    (M "terminals/tmux.nix")

    (M "cli/default.nix")

    (M "dev/default.nix")
    # (M "dev/python-cuda.nix")
    (M "dev/python-standard.nix")
  ];

  home.packages = with pkgs;[
    # JUNK ::
    cmatrix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Forces Chromium and Electron apps to use native Wayland, should this be here?
  };

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
