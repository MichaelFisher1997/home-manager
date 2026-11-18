{ lib, pkgs, unstable, ... }:

let
  blacksmith = pkgs.stdenvNoCC.mkDerivation (finalAttrs:
    let
      platform = {
        x86_64-linux = {
          arch = "amd64";
          hash = "sha256-CJowHqXMk6dWDH8RBpEVR/39RvxcDO9weeKmKiLpcc4=";
        };
        aarch64-linux = {
          arch = "arm64";
          hash = "sha256-SsyhXLEIssz/KV39PkRLgakP1SPVdExl/FKj7LvOfRc=";
        };
      }.${pkgs.stdenv.hostPlatform.system};
    in
    {
      pname = "blacksmith";
      version = "0.5.3";

      src = pkgs.fetchurl {
        url = "https://clireleases.blacksmith.sh/cli/v${finalAttrs.version}/linux/${platform.arch}/blacksmith";
        inherit (platform) hash;
      };

      nativeBuildInputs = [ pkgs.makeWrapper ];
      dontUnpack = true;
      dontStrip = true;

      installPhase = ''
        runHook preInstall
        install -Dm755 "$src" "$out/bin/blacksmith"
        wrapProgram "$out/bin/blacksmith" \
          --set BLACKSMITH_DISABLE_AUTO_UPDATE 1 \
          --prefix PATH : "${lib.makeBinPath [ pkgs.rsync pkgs.xdg-utils ]}"
        runHook postInstall
      '';

      meta = {
        description = "CLI for Blacksmith CI";
        homepage = "https://docs.blacksmith.sh/blacksmith-cli/overview";
        mainProgram = "blacksmith";
        platforms = [ "x86_64-linux" "aarch64-linux" ];
        sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
      };
    });
in
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
      blacksmith
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
