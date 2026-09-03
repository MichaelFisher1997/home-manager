{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      famistudio
      haruna
      slack
    ])
    ++ [
      (unstable.blender.override { rocmSupport = true; })
    ]
    ++ (with pkgs; [
      discord
      vlc
      mpv
    ]);
}
