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

  # nixpkgs fetches steamcmd from web.archive.org, unreachable on this network;
  # same file lives on Valve's CDN
  steamcmd-cdn = unstable.steamcmd.overrideAttrs (old: {
    src = unstable.fetchurl {
      url = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz";
      hash = "sha256-zr8ARr/QjPRdprwJSuR6o56/QVXl7eQTc7V5uPEHHnw=";
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
      protonup-ng
      gamemode
      steamcmd-cdn
    ])
    ++ [
      antimicrox-latest
    ];
}
