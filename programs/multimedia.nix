{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    unstable.famistudio
    teams-for-linux
    discord
    webcord
    slack
    vesktop
    vlc
    simplescreenrecorder
    haruna
    mpv

    betterdiscord-installer
  ];
}