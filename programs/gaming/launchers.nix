{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    steamcmd
    protonup-ng
    protontricks
    lutris
    bottles
    unstable.prismlauncher
    unstable.luanti
    wine
    gamemode
    antimicrox
    unstable.pcsx2
    tiled
  ];
}
