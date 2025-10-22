{ config, lib, inputs, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # shitty hack::: enable stuff here that is not available on home-manager 
  programs.hyprland.enable = true;

  imports = [
      /etc/nixos/hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  time.timeZone = "Europe/London";

  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Don't forget to set a password with ‘passwd’.
  users.users.lipe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    neovim
    alacritty
    playerctl
    brightnessctl
    git
  ];
  
  # List services that you want to enable:
  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  system.stateVersion = "25.05"; # DO NOT change
}
