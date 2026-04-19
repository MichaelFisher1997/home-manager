{ config, lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
  ewwMonitor = ({
    "hyprtop" = "eDP-1";
    "hypr-nix" = "DP-1";
  }.${vars.hostName} or "DP-1");
  ewwConfigDir = "${config.xdg.configHome}/eww";
  ewwYuckText = lib.replaceStrings
    [
      "./scripts/"
      "\"scripts/"
      "images/"
      "\"DP-1\""
    ]
    [
      "${ewwConfigDir}/scripts/"
      "\"${ewwConfigDir}/scripts/"
      "${ewwConfigDir}/images/"
      "\"${ewwMonitor}\""
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
