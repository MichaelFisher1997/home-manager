{
  pkgs,
  unstable,
  lib,
  ...
}:

let
  # Quickshell bar palette (ported from eww.scss, see eww/ and the
  # quickshell-config flake). Qt widgets are recolored to match.
  colorMap = {
    "1e1e2e" = "0f0f17"; # base -> bar background
    "181825" = "0a0a10"; # mantle
    "11111b" = "08080c"; # crust
    "313244" = "22242b"; # surface0 -> accent surface
    "45475a" = "2e313a"; # surface1
    "585b70" = "3e424f"; # surface2 -> faint
    "6c7086" = "6b7280"; # overlay0 -> muted
    "7f849c" = "7f8697"; # overlay1
    "9399b2" = "929aa9"; # overlay2
    "a6adc8" = "9ba6ba"; # subtext0
    "bac2de" = "aeb9cd"; # subtext1
    "cdd6f4" = "bfc9db"; # text -> bar text
    "89b4fa" = "a1bdce"; # blue -> accent
    "7ea5e6" = "8fb0c2"; # blue (pressed)
    "97bbf9" = "b3ccdb"; # blue (hover)
    "74c7ec" = "8fb6c9"; # sapphire
    "89dceb" = "93c4d4"; # sky
    "94e2d5" = "9fc9c0"; # teal
    "a6e3a1" = "98c379"; # green -> good
    "f9e2af" = "e5c07b"; # yellow -> warn
    "fab387" = "e4c9af"; # peach
    "eba0ac" = "d99a9f"; # maroon
    "f38ba8" = "e06c75"; # red -> bad
    "f5c2e7" = "e5809e"; # pink
    "f2cdcd" = "e6b9c6"; # flamingo
    "f5e0dc" = "ecd5d8"; # rosewater
    "cba6f7" = "d7beda"; # mauve -> accent strong
    "b4befe" = "b8a8d0"; # lavender
  };

  sedColors = lib.concatMapStrings (
    pair:
    "-e 's/#${pair.from}/#${pair.to}/g' -e 's/#${lib.toUpper pair.from}/#${lib.toUpper pair.to}/g' "
  ) (lib.mapAttrsToList (from: to: { inherit from to; }) colorMap);

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
