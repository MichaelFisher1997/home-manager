{ pkgs, unstable, vars, nix-stt, quickshell-config, ... }:
{
  imports = [
    nix-stt.homeManagerModules."nix-stt"
    quickshell-config.homeModules.default
  ];

  programs.nix-stt = {
    enable = true;
    # Avoid the pinned module's deprecated pkgs.system default.
    package = nix-stt.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      model = "mistralai/voxtral-small-transcribe-3-0";
      price_per_second = 0.000067;
    };
  };

  programs.quickshell-config.enable = true;
}
