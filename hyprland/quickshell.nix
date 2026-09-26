{ config, pkgs, unstable, lib, vars, nix-stt, quickshell-config, ... }:
{
  imports = [
    nix-stt.homeManagerModules."nix-stt"
    quickshell-config.homeModules.default
  ];

  programs.nix-stt = {
    enable = true;
    settings = {
      model = "mistralai/voxtral-small-24b-2507-stt";
      price_per_second = 0.00005;
    };
  };

  programs.quickshell-config.enable = true;
  # The pinned Quickshell dictation widget still invokes the old command name.
  programs.quickshell-config.extraPackages = [
    (pkgs.writeShellScriptBin "nix-tts" ''
      exec ${lib.getExe config.programs.nix-stt.package} "$@"
    '')
  ];
}
