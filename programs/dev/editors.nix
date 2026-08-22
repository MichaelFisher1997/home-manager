{ pkgs, unstable, windsurf-flake, opencode-desktop-flake, ... }:

let
  cursor-agent = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "cursor-agent";
    version = "2026.07.23-e383d2b";

    src = pkgs.fetchurl {
      url = "https://downloads.cursor.com/lab/${version}/linux/x64/agent-cli-package.tar.gz";
      hash = "sha256-cCrVlSE77l3wJovp+AoZ8p/M6qKkL8VeOfK1GZBR8MQ=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/lib/cursor-agent $out/bin
      cp -R dist-package/* $out/lib/cursor-agent/
      patchShebangs $out/lib/cursor-agent

      ln -s $out/lib/cursor-agent/cursor-agent $out/bin/agent
      ln -s $out/lib/cursor-agent/cursor-agent $out/bin/cursor-agent
    '';

    meta.mainProgram = "agent";
  };
in
{
  home.packages = with pkgs; [
    sublime
    vscode
    unstable.zed-editor
    windsurf-flake.packages.x86_64-linux.default
    opencode-desktop-flake.packages.x86_64-linux.default
    cursor-agent
  ];
}
