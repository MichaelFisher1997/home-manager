{ pkgs, unstable, ... }:

{
  home.packages =
    (with unstable; [
      act
      devenv
      doppler
      ffmpeg
      gh
      git-credential-manager
      libavif
      nix-prefetch-git
      pnpm
      railway
      uv
      whois
      wrangler
    ])
    ++ [
      # The current unstable Codex build requires these system libraries.
      (unstable.codex.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [ unstable.aws-lc unstable.oniguruma unstable.sqlite unstable.zstd ];
      }))
    ]
    ++ (with pkgs; [
      exercism
      git-lfs
      gnumake
      libsecret
      nixpacks
    ]);
}
