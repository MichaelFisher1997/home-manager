{ lib }:
let
  bind = key: command: flags: {
    _args = [
      key
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(${builtins.toJSON command})")
      flags
    ];
  };
  repeatable = { locked = true; repeating = true; };
in {
  bind = [
    (bind "XF86MonBrightnessUp" "/run/current-system/sw/bin/brillo -A 5" repeatable)
    (bind "XF86MonBrightnessDown" "/run/current-system/sw/bin/brillo -U 5" repeatable)
    (bind "XF86KbdBrightnessUp" "brightnessctl -q --device='tpacpi::kbd_backlight' set 1+" repeatable)
    (bind "XF86KbdBrightnessDown" "brightnessctl -q --device='tpacpi::kbd_backlight' set 1-" repeatable)
    (bind "XF86AudioLowerVolume" "pamixer --decrease 5" repeatable)
    (bind "XF86AudioRaiseVolume" "pamixer --increase 5" repeatable)
    (bind "XF86AudioMute" "pamixer --toggle-mute" { locked = true; })
  ];
}
