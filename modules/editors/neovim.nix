{ config, lib, inputs, pkgs, ... }:

{
  # we just enable neovim here, config is cloned from repo
  programs.neovim.enable = true;
}
