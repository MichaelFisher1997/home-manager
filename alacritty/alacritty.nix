{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      terminal = {
        shell = {
          program = "zellij";
        };
      };

      window = {
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        decorations_theme_variant = "Dark";
        opacity = 0.8;
      };

      colors.primary.background = "#000000";

      font = {
        size = 10.0;
        normal = { family = "monospace"; style = "Regular"; };
        bold = { family = "monospace"; style = "Bold"; };
        italic = { family = "monospace"; style = "Italic"; };
        bold_italic = { family = "monospace"; style = "Bold Italic"; };
      };

      general = {
        live_config_reload = true;
        working_directory = "None";
      };
    };
  };
}

