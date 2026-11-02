{ pkgs, unstable, ... }:

let
  antimicrox-version = "3.6.1";
  antimicrox-latest =
    if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then
      unstable.stdenv.mkDerivation {
        pname = "antimicrox";
        version = antimicrox-version;
        src = unstable.fetchurl {
          url = "https://github.com/AntiMicroX/antimicrox/releases/download/${antimicrox-version}/antimicrox-${antimicrox-version}-ubuntu-24.04-x86_64.deb";
          hash = "sha256-Azz992UdWfzDcsD6s43wJXUIyXItvr2JMa7D30WYOUg=";
        };

        nativeBuildInputs = with unstable; [ dpkg autoPatchelfHook qt6.wrapQtAppsHook ];
        buildInputs = with unstable; [ SDL2 libx11 libxi libxtst qt6.qtbase qt6.qtwayland stdenv.cc.cc.lib ];

        dontUnpack = true;
        dontConfigure = true;
        dontBuild = true;
        installPhase = ''
          runHook preInstall
          dpkg-deb -x $src unpacked
          mkdir -p $out
          cp -r unpacked/usr/. $out/
          runHook postInstall
        '';

        meta = {
          description = "GUI for mapping keyboard and mouse controls to a gamepad";
          homepage = "https://github.com/AntiMicroX/antimicrox";
          license = pkgs.lib.licenses.gpl3Plus;
          platforms = [ "x86_64-linux" ];
          sourceProvenance = [ pkgs.lib.sourceTypes.binaryNativeCode ];
          mainProgram = "antimicrox";
        };
      }
    else
      # The upstream binary is x86_64-only; preserve the source build elsewhere.
      unstable.antimicrox.overrideAttrs (_: {
        version = antimicrox-version;
        src = unstable.fetchFromGitHub {
          owner = "AntiMicroX";
          repo = "antimicrox";
          rev = antimicrox-version;
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
      bottles
      wine
      tiled
      prismlauncher
      luanti
      pcsx2
    ])
    ++ (with pkgs; [
      # Unstable Lutris pulls in GTK 2, which is currently marked broken.
      lutris
      protonup-ng
      gamemode
      steamcmd-cdn
    ])
    ++ [
      antimicrox-latest
    ];
}
