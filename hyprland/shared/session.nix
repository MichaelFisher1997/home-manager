{
  exec-once = [
    "awww-daemon"
    "awww img ~/.config/hypr/wallpaper-main.jpg --outputs DP-1,DP-2 --transition-type simple || swaybg -o DP-1 -i ~/.config/hypr/wallpaper-main.jpg -m fill -o DP-2 -i ~/.config/hypr/wallpaper-main.jpg -m fill"
    "awww img ~/.config/hypr/wallpaper-uw.jpg --outputs HDMI-A-1 --transition-type simple || swaybg -o HDMI-A-1 -i ~/.config/hypr/wallpaper-uw.jpg -m fill"
    "hyprsunset"
    "udiskie"
    "blueman-applet"
    "nm-applet --indicator"
  ];

  env = [
    "XCURSOR_THEME,Bibata-Modern-Ice"
    "XCURSOR_SIZE,24"
    "HYPRCURSOR_THEME,Bibata-Modern-Ice"
    "HYPRCURSOR_SIZE,24"
    "_JAVA_AWT_WM_NONREPARENTING,1"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
  ];
}
