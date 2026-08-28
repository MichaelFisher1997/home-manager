{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    unstable.famistudio
    teams-for-linux
    discord
    slack
    vlc
    simplescreenrecorder
    haruna
    mpv
  ];
}