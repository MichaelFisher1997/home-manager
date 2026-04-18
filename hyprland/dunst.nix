{ pkgs, ... }:
{
  home.packages = [ pkgs.dunst ];

  services.dunst.enable = true;
  services.dunst.settings = {
    global = {
      font = "HackGen Console NF 10";
      frame_color = "#e5809e";
      separator_color = "#323232";
      corner_radius = 16;
      gap_size = 8;
      padding = 12;
      horizontal_padding = 14;
      background = "#282828";
      foreground = "#f4d9e1";
      highlight = "#e6b9c6";
      timeout = 8;
      width = "(200, 400)";
      offset = "10x10";
    };

    urgency_low = {
      background = "#282828";
      foreground = "#928374";
      frame_color = "#323232";
      timeout = 4;
    };

    urgency_normal = {
      background = "#282828";
      foreground = "#f4d9e1";
      frame_color = "#e5809e";
      timeout = 8;
    };

    urgency_critical = {
      background = "#2a1a1a";
      foreground = "#f4d9e1";
      frame_color = "#db4b4b";
      timeout = 0;
    };
  };
}
