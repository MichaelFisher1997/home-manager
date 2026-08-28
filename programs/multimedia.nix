{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      famistudio
      haruna
      slack
    ])
    ++ (with pkgs; [
      discord
      vlc
      mpv
    ]);
}
