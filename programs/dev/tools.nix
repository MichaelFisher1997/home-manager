{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      act
      codex
      devenv
      doppler
      ffmpeg
      gh
      git-credential-manager
      libavif
      pnpm
      railway
      uv
      whois
      wrangler
    ])
    ++ (with pkgs; [
      exercism
      git-lfs
      gnumake
      libsecret
      nix-prefetch-git
      nixpacks
    ]);
}
