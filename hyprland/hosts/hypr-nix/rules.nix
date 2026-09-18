{
  window_rule = [
    {
      match.class = "^(steam_app_.*)$";
      fullscreen = true;
      monitor = "0";
      size = [ 2560 1440 ];
      center = true;
    }
    { match.class = "^(lutris)$"; fullscreen = true; }
    { match.class = "^(heroic)$"; fullscreen = true; }
    {
      match.class = "^(steam_app_1874880)$";
      immediate = true;
      fullscreen = true;
      allows_input = true;
    }
  ];
}
