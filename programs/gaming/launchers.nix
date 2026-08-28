{ pkgs, unstable, ... }:

let
  # unstable lags antimicrox; pin newest upstream release
  antimicrox-latest = unstable.antimicrox.overrideAttrs (old: rec {
    version = "3.6.1";
    src = unstable.fetchFromGitHub {
      owner = "AntiMicroX";
      repo = "antimicrox";
      rev = version;
      hash = "sha256-frPXUTbD5Wk0Wo8E9L8Es5GCvWY55Qx0RGSkYDaVs6g=";
    };
  });
in
{
  home.packages =
    (with unstable; [
      protontricks
      lutris
      bottles
      wine
      tiled
      prismlauncher
      luanti
      pcsx2
    ])
    ++ (with pkgs; [
      steamcmd
      protonup-ng
      gamemode
    ])
    ++ [
      antimicrox-latest
    ];
}
