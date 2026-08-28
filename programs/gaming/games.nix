{ pkgs, ... }:

{
  home.packages = with pkgs; [
    endless-sky
    cataclysm-dda
    xonotic
    simutrans_binaries
    ryubing
  ];
}