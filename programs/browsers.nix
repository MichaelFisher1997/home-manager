{ pkgs, zen-browser, ... }:

let
  zen-twilight = zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight;
  zen-wrapped = pkgs.runCommand "zen-twilight-vaapi" {
    nativeBuildInputs = [ pkgs.makeWrapper ];
  } ''
    mkdir -p $out/bin
    makeWrapper ${zen-twilight}/bin/zen-twilight $out/bin/zen-twilight \
      --add-flags "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization" \
      --add-flags "--disable-features=UseChromeOSDirectVideoDecoder" \
      --add-flags "--ozone-platform-hint=auto"

    mkdir -p $out/share/applications
    cp ${zen-twilight}/share/applications/zen-twilight.desktop $out/share/applications/
    substituteInPlace $out/share/applications/zen-twilight.desktop \
      --replace-fail "Exec=zen-twilight" "Exec=$out/bin/zen-twilight"

    if [ -d ${zen-twilight}/share/icons ]; then
      mkdir -p $out/share/icons
      cp -r ${zen-twilight}/share/icons/* $out/share/icons/
    fi
  '';
in
{
  home.packages = with pkgs; [
    brave
    google-chrome
    tor-browser
    zen-wrapped
  ];
}