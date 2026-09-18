{ lib }:
{
  on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function()
            hl.exec_cmd("hypridle")
          end
        '')
      ];
    }
  ];

  env = [
    { _args = [ "SDL_VIDEODRIVER" "wayland" ]; }
    { _args = [ "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS" "0" ]; }
    { _args = [ "WINE_FULLSCREEN_FSR" "1" ]; }
    { _args = [ "WINE_FULLSCREEN_INTEGER_SCALING" "1" ]; }
  ];
}
