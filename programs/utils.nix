{
  pkgs,
  unstable,
  neonfetch,
  ...
}:

let
  # pywal16's wrapper flags must be separate arguments, not one combined string.
  pywal-fixed = unstable.pywal16.overrideAttrs (_: {
    makeWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      (unstable.lib.makeBinPath [ unstable.imagemagick ])
    ];
  });

  # nixpkgs (even unstable) lags these two upstream releases; pin newest
  rpi-imager-latest = unstable.rpi-imager.overrideAttrs (old: rec {
    version = "2.0.11.1";
    src = unstable.fetchFromGitHub {
      owner = "raspberrypi";
      repo = "rpi-imager";
      rev = "v${version}";
      hash = "sha256-FjFbDRwykY9q+aDJsEiXhRXjmy12DNpAQTUuF3tRIu4=";
    };
  });

  networkmanager-dmenu-latest = unstable.networkmanager_dmenu.overrideAttrs (old: rec {
    version = "2.7.1";
    src = unstable.fetchFromGitHub {
      owner = "firecat53";
      repo = "networkmanager-dmenu";
      rev = "v${version}";
      hash = "sha256-vCWI+gcMLNmk7rC90+ovFe7t1ZRTDbBrHp4dZO8Ss3Q=";
    };
  });
in
{
  home.packages =
    # from unstable: fast-moving or stable-lagging utilities
    (with unstable; [
      fastfetch
      calc
      maim
      xdotool
      pika-backup
      sunshine
      socat
      libinput
    ])
    ++ [
      pywal-fixed
      rpi-imager-latest
      networkmanager-dmenu-latest
      neonfetch.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]
    # from stable: already at the newest upstream release / frozen upstreams
    ++ (with pkgs; [
      xclip
      guacamole-client
      speedtest-cli
    ]);
}
