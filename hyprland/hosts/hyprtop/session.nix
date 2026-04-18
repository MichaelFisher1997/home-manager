{
  exec-once = [
    "hypridle"
  ];

  env = [
    "SDL_VIDEODRIVER,wayland"
    "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS,0"
    "WINE_FULLSCREEN_FSR,1"
    "WINE_FULLSCREEN_INTEGER_SCALING,1"
  ];
}
