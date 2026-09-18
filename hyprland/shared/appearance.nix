{
  config = {
    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 2;
      col = {
        active_border = {
          colors = [ "rgba(33ccffee)" "rgba(00ff99ee)" ];
          angle = 45;
        };
        inactive_border = "rgba(595959aa)";
      };
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

    animations.enabled = true;

    dwindle.preserve_split = true;

    master.new_status = "master";

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      disable_watchdog_warning = true;
      on_focus_under_fullscreen = 2;
      mouse_move_focuses_monitor = true;
    };

    render.direct_scanout = 0;
  };

  curve._args = [
    "myBezier"
    {
      type = "bezier";
      points = [
        [ 0.05 0.9 ]
        [ 0.1 1.05 ]
      ];
    }
  ];

  animation = [
    { leaf = "windows"; enabled = true; speed = 7; bezier = "myBezier"; }
    { leaf = "windowsOut"; enabled = true; speed = 7; bezier = "default"; style = "popin 80%"; }
    { leaf = "border"; enabled = true; speed = 10; bezier = "default"; }
    { leaf = "borderangle"; enabled = true; speed = 8; bezier = "default"; }
    { leaf = "fade"; enabled = true; speed = 7; bezier = "default"; }
    { leaf = "workspaces"; enabled = true; speed = 6; bezier = "default"; }
  ];
}
