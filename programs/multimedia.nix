{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    unstable.famistudio
    teams-for-linux
    discord
    unstable.webcord
    slack
    vesktop
    vlc
    simplescreenrecorder
    haruna
    mpv

    betterdiscord-installer
  ];
}