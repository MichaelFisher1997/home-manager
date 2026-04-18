{ lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
in {
  xdg.configFile."hypr/wallpaper.jpg" = {
    source = ./wallpaper.jpg;
    force = true;
  };

  xdg.configFile."hypr/hyprlock.conf" = {
    source = ./hyprlock.conf;
    force = true;
  };

  xdg.configFile."hypr/hypridle.conf" = lib.mkIf isLaptop {
    source = ./hypridle.conf;
    force = true;
  };
}
