{ lib }:
let
  startupCommands = [
    "awww-daemon"
    "awww img ~/.config/hypr/wallpaper-main.jpg --outputs DP-1,DP-2 --transition-type simple || swaybg -o DP-1 -i ~/.config/hypr/wallpaper-main.jpg -m fill -o DP-2 -i ~/.config/hypr/wallpaper-main.jpg -m fill"
    "awww img ~/.config/hypr/wallpaper-uw.jpg --outputs HDMI-A-1 --transition-type simple || swaybg -o HDMI-A-1 -i ~/.config/hypr/wallpaper-uw.jpg -m fill"
    "hyprsunset"
    "udiskie"
    "blueman-applet"
    "nm-applet --indicator"
  ];
in {
  on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            ${lib.concatMapStringsSep "\n  " (command: "hl.exec_cmd(${builtins.toJSON command})") startupCommands}
          end
        '')
      ];
    }
  ];

  env = [
    { _args = [ "XCURSOR_THEME" "Bibata-Modern-Ice" ]; }
    { _args = [ "XCURSOR_SIZE" "24" ]; }
    { _args = [ "HYPRCURSOR_THEME" "Bibata-Modern-Ice" ]; }
    { _args = [ "HYPRCURSOR_SIZE" "24" ]; }
    { _args = [ "_JAVA_AWT_WM_NONREPARENTING" "1" ]; }
    { _args = [ "XDG_CURRENT_DESKTOP" "Hyprland" ]; }
    { _args = [ "XDG_SESSION_TYPE" "wayland" ]; }
    { _args = [ "XDG_SESSION_DESKTOP" "Hyprland" ]; }
  ];
}
