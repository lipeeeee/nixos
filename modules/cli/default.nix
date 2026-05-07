{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    tree
    zip
    git
    wget
    curl
    ripgrep
    fd
    fzf
    unzip
  ];
}
