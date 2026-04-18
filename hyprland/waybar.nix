{ pkgs, lib, vars, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
in {
  home.packages = [ pkgs.waybar ];

  xdg.configFile."waybar/style.css" = {
    source = ../waybar/style.css;
    force = true;
  };

  xdg.configFile."waybar/config.jsonc" = {
    text = lib.replaceStrings
      [ "@MODULES_LEFT@" ]
      [
        (if isLaptop then
          ''["custom/launcher", "hyprland/workspaces", "backlight", "battery", "custom/playerctl", "custom/playerlabel"]''
        else
          ''["custom/launcher", "hyprland/workspaces", "custom/playerctl", "custom/playerlabel"]'')
      ]
      (builtins.readFile ../waybar/config.jsonc);
    force = true;
  };
}
