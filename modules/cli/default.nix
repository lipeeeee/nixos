{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    tree
    git
    wget
    curl
    ripgrep
    fd
    fzf
    unzip
  ];
}
