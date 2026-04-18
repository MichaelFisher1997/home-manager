{ config, lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
  ewwConfigDir = "${config.xdg.configHome}/eww";
  ewwYuckText = lib.replaceStrings
    [
      "./scripts/"
      "\"scripts/"
      "images/"
    ]
    [
      "${ewwConfigDir}/scripts/"
      "\"${ewwConfigDir}/scripts/"
      "${ewwConfigDir}/images/"
    ]
    (builtins.readFile ../eww/eww.yuck);
  ewwScssText = lib.replaceStrings
    [ "images/" ]
    [ "${ewwConfigDir}/images/" ]
    (builtins.readFile ../eww/eww.scss);
in {
  xdg.configFile."eww/eww.scss" = lib.mkIf isLaptop {
    text = ewwScssText;
    force = true;
  };

  xdg.configFile."eww/launch_bar" = lib.mkIf isLaptop {
    source = ../eww/launch_bar;
    force = true;
  };

  xdg.configFile."eww/scripts" = lib.mkIf isLaptop {
    source = ../eww/scripts;
    recursive = true;
    force = true;
  };

  xdg.configFile."eww/images" = lib.mkIf isLaptop {
    source = ../eww/images;
    recursive = true;
    force = true;
  };

  xdg.configFile."eww/eww.yuck" = lib.mkIf isLaptop {
    text = ewwYuckText;
    force = true;
  };
}
