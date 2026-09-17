# Shared palette of the quickshell bar (ported from eww.scss, see eww/ and
# the quickshell-config flake) plus the Catppuccin -> quickshell remaps used
# to recolor Qt/Kvantum and GTK themes. Data file, not a Home Manager module.
let
  palette = {
    bg = "0f0f17";
    bgDark = "0a0a10";
    bgDarker = "08080c";
    surface = "22242b";
    surfaceAlt = "2e313a";
    faint = "3e424f";
    muted = "6b7280";
    mutedAlt = "7f8697";
    overlayAlt = "929aa9";
    subtext = "9ba6ba";
    subtextAlt = "aeb9cd";
    text = "bfc9db";
    accent = "a1bdce";
    accentPressed = "8fb0c2";
    accentHover = "b3ccdb";
    sky = "93c4d4";
    sapphire = "8fb6c9";
    teal = "9fc9c0";
    lavender = "b8a8d0";
    lilac = "d7beda";
    good = "98c379";
    warn = "e5c07b";
    peach = "e4c9af";
    maroon = "d99a9f";
    bad = "e06c75";
    pink = "e5809e";
    flamingo = "e6b9c6";
    rosewater = "ecd5d8";
  };

  mocha = {
    "1e1e2e" = palette.bg;
    "181825" = palette.bgDark;
    "11111b" = palette.bgDarker;
    "313244" = palette.surface;
    "45475a" = palette.surfaceAlt;
    "585b70" = palette.faint;
    "6c7086" = palette.muted;
    "7f849c" = palette.mutedAlt;
    "9399b2" = palette.overlayAlt;
    "a6adc8" = palette.subtext;
    "bac2de" = palette.subtextAlt;
    "cdd6f4" = palette.text;
    "89b4fa" = palette.accent;
    "82abed" = palette.accentPressed;
    "8fcbe8" = palette.accentHover;
    "97bbf9" = palette.accentHover;
    "74c7ec" = palette.sapphire;
    "89dceb" = palette.sky;
    "94e2d5" = palette.teal;
    "a6e3a1" = palette.good;
    "f9e2af" = palette.warn;
    "f9e2a7" = palette.warn;
    "fab387" = palette.peach;
    "eba0ac" = palette.maroon;
    "f38ba8" = palette.bad;
    "f5c2e7" = palette.pink;
    "f2cdcd" = palette.flamingo;
    "f5e0dc" = palette.rosewater;
    "cba6f7" = palette.lilac;
    "b4befe" = palette.lavender;
  };

  # The GTK theme mixes Latte for text/signals into its dark variant and
  # adds a few custom dark surfaces.
  latte = {
    "eff1f5" = palette.text;
    "e9e9ed" = palette.text;
    "e6e9ef" = palette.subtextAlt;
    "dce0e8" = palette.subtext;
    "4c4f69" = palette.muted;
    "5c5f77" = palette.mutedAlt;
    "6c6f85" = palette.overlayAlt;
    "8c8fa1" = palette.mutedAlt;
    "9ca0b0" = palette.muted;
    "7c7f93" = palette.muted;
    "acb0be" = palette.faint;
    "dc8a78" = palette.rosewater;
    "dd7878" = palette.flamingo;
    "ea76cb" = palette.pink;
    "8839ef" = palette.lilac;
    "9e91e8" = palette.lavender;
    "d20f39" = palette.bad;
    "e64553" = palette.maroon;
    "fe640b" = palette.peach;
    "df8e1d" = palette.warn;
    "40a02b" = palette.good;
    "179299" = palette.teal;
    "04a5e5" = palette.sky;
    "209fb5" = palette.sapphire;
    "1e66f5" = palette.accent;
    "7287fd" = palette.lavender;
    "2ec27e" = palette.good;
    "3584e4" = palette.accent;
    "1c71d8" = palette.accentPressed;
  };

  gtkExtras = {
    "232634" = palette.surface;
    "252531" = "14141b";
    "292c3c" = "14141b";
    "393947" = palette.faint;
  };
in
{
  inherit palette;
  fromCatppuccin = mocha // latte // gtkExtras;
}
