{
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
}
