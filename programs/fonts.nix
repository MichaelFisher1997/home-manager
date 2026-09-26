{ lib, pkgs, unstable, ... }:

let
  # nixpkgs lags Font Awesome releases; pin the newest upstream release
  font-awesome-latest = unstable.font-awesome.overrideAttrs (old: rec {
    version = "7.3.1";
    src = unstable.fetchFromGitHub {
      owner = "FortAwesome";
      repo = "Font-Awesome";
      rev = version;
      hash = "sha256-FQ2XvDi2JQ/XR8xgy3f8uJnsQW/lF0/IehCJvSHS1Y4=";
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
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ])
    ++ [
      font-awesome-latest
    ]
    # from stable: already at the newest upstream release
    ++ (with pkgs; [
      # pinned to stable: unstable's 34.7.0 is not yet on cache.nixos.org and
      # builds nodejs from source (hours); move back to unstable once cached
      iosevka
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      twemoji-color-font
      emacs-all-the-icons-fonts
    ]);
}
