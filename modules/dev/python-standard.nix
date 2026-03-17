{ pkgs, ... }:

{
  # disable __pycache__
  home.sessionVariables = {
    PYTHONDONTWRITEBYTECODE = "1";
  };

  home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      numpy
      pyopencl
      pytest
    ]))
  ];
}
