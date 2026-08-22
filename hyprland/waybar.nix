{ pkgs, lib, vars, nix-tts, ... }:
let
  isLaptop = vars.hostName == "hyprtop";
in {
  imports = [ nix-tts.homeManagerModules."nix-tts" ];

  home.packages = [ pkgs.waybar ];

  programs.nix-tts = {
    enable = true;
    settings = {
      model = "mistralai/voxtral-small-24b-2507-stt";
      price_per_second = 0.00005;
    };
  };

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
