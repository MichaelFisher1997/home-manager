{ pkgs, unstable, redot-flake, ... }:

{
  home.packages =
    (with unstable; [
      endless-sky
    ])
    ++ (with pkgs; [
      xonotic
      ryubing
    ])
    ++ [
      redot-flake.packages.${pkgs.stdenv.hostPlatform.system}.redot
    ];
}
