{ pkgs, unstable, ... }:

{
  home.packages = with pkgs; [
    flatpak-builder
    gnumake
    unstable.stripe-cli
    unstable.doppler
    libsecret
    unstable.backblaze-b2
    uv
    unstable.goose-cli
    git-credential-manager
    wrangler
    unstable.railway
    nixpacks
    exercism
    unstable.supabase-cli
    ffmpeg
    libavif
    whois
    git
    git-lfs
    act
    nix-prefetch-git
    gh
    codex
    unstable.claude-code
    unstable.antigravity
  ];
}