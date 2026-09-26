{ pkgs, ... }:
{
  home.packages = [ (pkgs.texliveSmall.withPackages (ps: [ ps.latexmk ])) ];
}
