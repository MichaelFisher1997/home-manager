{ lib }:
{
  env = [
    { _args = [ "LIBVA_DRIVER_NAME" "radeonsi" ]; }
    { _args = [ "WLR_RENDERER" "vulkan" ]; }
    { _args = [ "__GLX_VENDOR_LIBRARY_NAME" "mesa" ]; }
    { _args = [ "SDL_VIDEODRIVER" "wayland" ]; }
    { _args = [ "WLR_DRM_DEVICES" "/dev/dri/card1:/dev/dri/card0" ]; }
    { _args = [ "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS" "0" ]; }
    { _args = [ "SDL_VIDEO_FULLSCREEN_DISPLAY" "0" ]; }
    { _args = [ "WINE_FULLSCREEN_FSR" "1" ]; }
    { _args = [ "WINE_FULLSCREEN_INTEGER_SCALING" "1" ]; }
  ];
}
