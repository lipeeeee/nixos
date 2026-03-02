# WARNING: is meant to be installed with nvidia drivers, not sure if ROCm/HIP/Metal works
{ pkgs, ... }:

let
  cudaPkgs = import pkgs.path {
    inherit (pkgs) system;
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  };
in
{
  home.packages = [
    (cudaPkgs.python3.withPackages (ps: with ps; [
      requests
      numpy
      torch
      torchvision
      torchaudio
    ]))
  ];
}
