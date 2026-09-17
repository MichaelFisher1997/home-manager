{
  pkgs,
  unstable,
  lib,
  ...
}:

let
  inherit (import ./quickshell-palette.nix) fromCatppuccin;

  sedColors = lib.concatMapStrings (
    pair:
    "-e 's/#${pair.from}/#${pair.to}/g' -e 's/#${lib.toUpper pair.from}/#${lib.toUpper pair.to}/g' "
  ) (lib.mapAttrsToList (from: to: { inherit from to; }) fromCatppuccin);

  upstream = unstable.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "blue";
  };

  quickshellKvantum = pkgs.runCommand "quickshell-kvantum-theme" { } ''
    themeDir=$out/share/Kvantum/quickshell-dark
    mkdir -p $themeDir
    cp -r ${upstream}/share/Kvantum/catppuccin-mocha-blue/. $themeDir/
    chmod -R u+w $themeDir
    mv $themeDir/catppuccin-mocha-blue.kvconfig $themeDir/quickshell-dark.kvconfig
    mv $themeDir/catppuccin-mocha-blue.svg $themeDir/quickshell-dark.svg
    sed -i ${sedColors} $themeDir/quickshell-dark.svg $themeDir/quickshell-dark.kvconfig
    sed -i 's/^comment=.*/comment=Quickshell Dark/' $themeDir/quickshell-dark.kvconfig
    sed -i 's/^author=.*/author=MichaelFisher1997, based on Catppuccin Kvantum by elkrien/' $themeDir/quickshell-dark.kvconfig
  '';
in
{
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "kvantum";

    kvantum = {
      enable = true;
      themes = [ quickshellKvantum ];
      settings.General.theme = "quickshell-dark";
    };
  };

  # Needed since the KDE platform theme reads fonts/icons from kdeglobals.
  xdg.configFile."kdeglobals" = {
    force = true;
    text = ''
      [General]
      ColorScheme=BreezeDark
      font=Noto Sans,10
      fixedFont=JetBrainsMono Nerd Font,10
      menuFont=Noto Sans,10
      toolBarFont=Noto Sans,10
      smallestReadableFont=Noto Sans,8

      [Icons]
      Theme=breeze-dark
    '';
  };
}
