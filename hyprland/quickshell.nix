{ pkgs, unstable, lib, vars, nix-tts, quickshell-config, ... }:
{
  imports = [
    nix-tts.homeManagerModules."nix-tts"
    quickshell-config.homeModules.default
  ];

  programs.nix-tts = {
    enable = true;
    settings = {
      model = "mistralai/voxtral-small-24b-2507-stt";
      price_per_second = 0.00005;
    };
  };

  programs.quickshell-config.enable = true;
}
