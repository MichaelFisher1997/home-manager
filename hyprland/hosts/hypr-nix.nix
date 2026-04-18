{
  monitor = [
    "HDMI-A-1,2560x1080@60,0x360,1"
    "DP-1,2560x1440@144,2560x0,1"
    "DP-2,2560x1440@144,2560x-1440,1"
    "WAYLAND-1,disable"
  ];

  env = [
    "LIBVA_DRIVER_NAME,radeonsi"
    "WLR_RENDERER,vulkan"
    "__GLX_VENDOR_LIBRARY_NAME,mesa"
    "SDL_VIDEODRIVER,wayland"
    "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
    "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS,0"
    "SDL_VIDEO_FULLSCREEN_DISPLAY,0"
    "WINE_FULLSCREEN_FSR,1"
    "WINE_FULLSCREEN_INTEGER_SCALING,1"
  ];

  workspace = [
    "1, monitor:HDMI-A-1, default:true"
    "2, monitor:HDMI-A-1"
    "3, monitor:DP-1, default:true"
    "4, monitor:DP-1"
    "10, monitor:DP-2, default:true"
  ];

  windowrulev2 = [
    "fullscreen,class:^(steam_app_.*)$"
    "fullscreen,class:^(lutris)$"
    "fullscreen,class:^(heroic)$"
    "monitor 0,class:^(steam_app_.*)$"
    "size 2560 1440,class:^(steam_app_.*)$"
    "center,class:^(steam_app_.*)$"
    "immediate,class:^(steam_app_1874880)$"
    "fullscreen,class:^(steam_app_1874880)$"
    "allowsinput,class:^(steam_app_1874880)$"
  ];
}
