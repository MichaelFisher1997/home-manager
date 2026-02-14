{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openttd
    endless-sky
    cataclysm-dda
    xonotic
    superTux
    mindustry-wayland
    simutrans_binaries
    nsnake
    ryubing
  ];
}