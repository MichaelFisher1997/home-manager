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

  xdg.configFile."hypr/hyprsunset.conf" = {
    text = ''
      max-gamma = 150

      profile {
          time = 07:00
          identity = true
          gamma = 1.0
      }

      profile {
          time = 20:00
          temperature = 4500
          gamma = 1.0
      }

      profile {
          time = 23:00
          temperature = 4000
          gamma = 1.0
      }
    '';
    force = true;
  };
}
