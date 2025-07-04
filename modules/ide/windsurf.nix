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

  # Windsurf MCP Configuration
  home.file = {
    ".codeium/windsurf/mcp_config.json" = {
      source = ./config/mcp_config.json;
      recursive = true;
    };
    ".config/Windsurf/User/keybindings.json" = {
      source = ./config/keybindings.json;
      recursive = true;
    };

  };
}
