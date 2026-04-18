{
  exec-once = [
    "hypridle"
  ];

  monitor = [
    "eDP-1,preferred,auto,1"
    "WAYLAND-1,disable"
  ];

  bindel = [
    ", XF86MonBrightnessUp, exec, /run/current-system/sw/bin/brillo -A 5"
    ", XF86MonBrightnessDown, exec, /run/current-system/sw/bin/brillo -U 5"
    ", XF86KbdBrightnessUp, exec, /run/current-system/sw/bin/brightnessctl -q --device='tpacpi::kbd_backlight' set 1+"
    ", XF86KbdBrightnessDown, exec, /run/current-system/sw/bin/brightnessctl -q --device='tpacpi::kbd_backlight' set 1-"
    ", XF86AudioLowerVolume, exec, pamixer --decrease 5"
    ", XF86AudioRaiseVolume, exec, pamixer --increase 5"
  ];

  bindl = [
    ", XF86AudioMute, exec, pamixer --toggle-mute"
  ];

  windowrulev2 = [
    "fullscreen,class:^(steam_app_.*)$"
    "fullscreen,class:^(lutris)$"
    "fullscreen,class:^(heroic)$"
  ];
}
