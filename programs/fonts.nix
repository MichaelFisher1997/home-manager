{ lib, pkgs, unstable, ... }:

let
  # nixpkgs lags Font Awesome releases; pin the newest upstream release
  font-awesome-latest = unstable.font-awesome.overrideAttrs (old: rec {
    version = "7.3.1";
    src = unstable.fetchurl {
      url = "https://github.com/FortAwesome/Font-Awesome/archive/${version}.tar.gz";
      hash = "sha256-1aIFVPqhrTAUiwXwkKVW4jSVxEZDXI38FiTTwOPCZAs=";
    };
  });
in
{
  fonts.fontconfig.enable = true;

  home.activation.refreshFontCache = lib.hm.dag.entryAfter [ "installPackages" ] ''
    run ${lib.getExe' pkgs.fontconfig "fc-cache"} -f
  '';

  home.packages =
    # from unstable: rides the fast-moving font release trains
    (with unstable; [
      noto-fonts
      iosevka
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ])
    ++ [
      font-awesome-latest
    ]
    # from stable: already at the newest upstream release
    ++ (with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      twemoji-color-font
      emacs-all-the-icons-fonts
    ]);
}
