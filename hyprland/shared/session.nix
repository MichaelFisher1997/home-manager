{
  exec-once = [
    "swww-daemon"
    "sh -c 'pkill -x waybar; waybar'"
    "swww img ~/.config/hypr/wallpaper.jpg --transition-type simple || swaybg -i ~/.config/hypr/wallpaper.jpg -m fill"
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
