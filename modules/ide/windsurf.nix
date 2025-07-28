{ config
, pkgs
, lib
, unstable
, ...
}:

{
  # AI related packages and configuration
  home.packages = with pkgs; [
    unstable.windsurf
  ];

  # Windsurf Configuration
  home.file = {
    ".config/Windsurf/User/keybindings.json" = {
      source = ./config/keybindings.json;
      recursive = true;
    };
  };
}
