{
  xdg.configFile."rofi/config.rasi" = {
    source = ../rofi/config.rasi;
    force = true;
  };

  # Override the adi1090x launcher's shared color/font files with our Waybar-matched palette
  xdg.configFile."rofi/colors/waybar.rasi" = {
    source = ../rofi/waybar.rasi;
    force = true;
  };

  xdg.configFile."rofi/launchers/type-1/shared/fonts.rasi" = {
    source = ../rofi/fonts.rasi;
    force = true;
  };

  xdg.configFile."rofi/launchers/type-1/shared/colors.rasi" = {
    text = ''
      @import "~/.config/rofi/colors/waybar.rasi"
    '';
    force = true;
  };
}
