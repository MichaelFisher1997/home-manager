{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      endless-sky
      cataclysm-dda
    ])
    ++ (with pkgs; [
      xonotic
      ryubing
    ]);
}
