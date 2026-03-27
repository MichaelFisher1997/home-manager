{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    flatpak-builder
    gnumake
    unstable.stripe-cli
    unstable.doppler
    libsecret
    uv
    git-credential-manager
    wrangler
    unstable.railway
    nixpacks
    exercism
    unstable.supabase-cli
    ffmpeg
    libavif
    whois
    git-lfs
    act
    nix-prefetch-git
    gh
    codex
  ];
}
