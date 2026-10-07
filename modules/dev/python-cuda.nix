# WARNING: is meant to be installed with nvidia drivers, not sure if ROCm/HIP/Metal works
# Cuda compilation is exhastive and lengthy, should add "cache.nixos-cuda.org" flag to skip some compilation
# there are also flags to limit how many cores the compilation uses/takes, recommended cuz linux cant manage memory proprely -_-
{ pkgs, ... }:

let
  cudaPkgs = import pkgs.path {
    inherit (pkgs.stdenv.hostPlatform) system;
    config = {
      allowUnfree = true;
      cudaSupport = true;
    };
  };
in
{
  # disable __pycache__
  home.sessionVariables = {
    PYTHONDONTWRITEBYTECODE = "1";
  };

  home.packages = [
    (cudaPkgs.python3.withPackages (ps: with ps; [
      requests
      numpy
      pyopencl
      pytest

      torch
      torchvision
      torchaudio
    ]))
  ];
}
