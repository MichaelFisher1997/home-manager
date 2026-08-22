{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    steamcmd
    protonup-ng
    unstable.godot
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
