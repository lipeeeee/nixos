{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.antigravity-nix.packages.${stdenv.hostPlatform.system}.google-antigravity-cli
    flutter
    postgresql
  ];
}
