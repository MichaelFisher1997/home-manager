{
  pkgs,
  unstable,
  lib,
  vars,
  ...
}:
let
  isLaptop = vars.hostName == "hyprtop";

  # Keyring payloads are binary, so preserve embedded NUL bytes when reading them.
  udiskie-fixed = unstable.udiskie.overrideAttrs (old: {
    postPatch = (old.postPatch or "") + ''
      substituteInPlace udiskie/keyutils.py \
        --replace-fail 'return buffer.value' 'return buffer.raw[:ret]'
    '';
  });
in
{
  home.packages =
    # from unstable: hyprwm family coherence + newer releases
    (with unstable; [
      hyprpaper
      hyprlock
      hyprshot
      hyprsunset
      awww
      swaybg
      waypaper
      nwg-look
      nwg-drawer
      catppuccin-kvantum
      thunar-volman
      thunar-dropbox-plugin
      thunar-archive-plugin
      tumbler
    ])
    ++ [ udiskie-fixed ]
    # from stable: already at the newest upstream release
    ++ (with pkgs; [
      wl-clipboard
      blueman
      networkmanagerapplet
      rofi
      hackgen-nf-font
      playerctl
      wlr-randr
      libcanberra-gtk3
      pamixer
      grim
      discocss
    ])
    ++ lib.optionals isLaptop [
      unstable.hypridle
    ];
}
