{ vars, ... }:
{
  "$terminal" = "alacritty";
  "$fileManager" = "thunar";
  "$menu" = "rofi -show drun";
  "$mainMod" = "SUPER";

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
    "WLR_USE_LIBINPUT,1"
  ];

  general = {
    gaps_in = 5;
    gaps_out = 20;
    border_size = 2;
    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";
    resize_on_border = false;
    allow_tearing = false;
    layout = "dwindle";
  };

  decoration = {
    rounding = 10;
    active_opacity = 1.0;
    inactive_opacity = 1.0;

    shadow = {
      enabled = true;
      range = 4;
      render_power = 3;
      color = "rgba(1a1a1aee)";
    };

    blur = {
      enabled = true;
      size = 3;
      passes = 1;
      vibrancy = 0.1696;
    };
  };

  animations = {
    enabled = true;
    bezier = [
      "myBezier, 0.05, 0.9, 0.1, 1.05"
    ];
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  master = {
    new_status = "master";
  };

  misc = {
    force_default_wallpaper = 0;
    disable_hyprland_logo = true;
    new_window_takes_over_fullscreen = 2;
    mouse_move_focuses_monitor = true;
  };

  render = {
    direct_scanout = false;
  };

  input = {
    kb_layout = "gb";
    follow_mouse = 1;
    mouse_refocus = true;
    sensitivity = 0;

    touchpad = {
      natural_scroll = false;
    };
  };

  bind = [
    "$mainMod, X, exec, $terminal"
    "$mainMod, Q, killactive,"
    "$mainMod, E, exec, $fileManager"
    "$mainMod, V, togglesplit,"
    "$mainMod, R, exec, $menu"
    "$mainMod, B, exec, zen-twilight"
    "$mainMod, P, pseudo,"
    "$mainMod, F, togglefloating,"
    "$mainMod, N, fullscreen,"
    "$mainMod, space, togglefloating,"
    "$mainMod, L, exec, hyprlock"
    "ALT, C, exec, hyprshot -m region -o ${vars.user.homeDirectory}/Pictures/hyprshots"
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"
    "$mainMod, S, togglespecialworkspace, magic"
    "$mainMod SHIFT, S, movetoworkspace, special:magic"
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
  ];

  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
