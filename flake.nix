{
  description = "Home Manager configuration of micqdf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    opencode-desktop-flake = {
      url = "github:OpenStaticFish/opencode-desktop-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    t3code-nightly = {
      url = "github:OpenStaticFish/t3code-desktop-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    neonfetch = {
      url = "github:OpenStaticFish/neonfetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-stt = {
      url = "github:OpenStaticFish/nix-stt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    redot-flake = {
      url = "github:MichaelFisher1997/redot-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    quickshell-config = {
      url = "github:MichaelFisher1997/quickshell-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixvim, opencode-desktop-flake, t3code-nightly, zen-browser, neonfetch, nix-stt, redot-flake, quickshell-config, ... }:
    let
      mkHome = hostName: vars:
        let
          unstable = import nixpkgs-unstable {
            inherit (vars) system;
            config.allowUnfree = true;
          };
          pkgs = import nixpkgs {
            inherit (vars) system;
            config.allowUnfree = true;
            overlays = [
              (final: prev: {
                nerd-fonts = prev.nerd-fonts // {
                  jetbrains-mono = unstable.nerd-fonts.jetbrains-mono;
                };
              })
            ];
          };
          bun_1_4_2 =
            let
              sources = {
                "aarch64-linux" = {
                  url = "https://github.com/oven-sh/bun/releases/download/bun-v1.4.2/bun-linux-aarch64.zip";
                  hash = "sha256-VDKLvC2cjgyfiSxUTWbFeoO4QTnjSQnl7oF1jxrI/ac=";
                };
                "x86_64-linux" = {
                  url = "https://github.com/oven-sh/bun/releases/download/bun-v1.4.2/bun-linux-x64.zip";
                  hash = "sha256-NjaPrvdSeHXV/6UuU81IAhdB8qg+tiCKjdZAaNQiqRM=";
                };
              };
            in
            unstable.bun.overrideAttrs (_: {
              version = "1.4.2";
              src = unstable.fetchurl (
                sources.${vars.system} or (throw "Unsupported Bun system: ${vars.system}")
              );
            });
          pkgs_32 = nixpkgs.legacyPackages.i686-linux;
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/${hostName}/default.nix ]
            ++ nixpkgs.lib.optionals (builtins.elem hostName [ "hypr-nix" "hyprtop" ]) [
              t3code-nightly.homeManagerModules.default
              {
                programs.t3code-nightly.enable = true;
                xdg.dataFile."applications/t3code.desktop".source =
                  "${t3code-nightly.packages.${vars.system}.default}/share/applications/t3code.desktop";
                programs.t3code-nightly.package = pkgs.writeShellApplication {
                  name = "t3code";
                  runtimeInputs = [ pkgs.appimage-run ];
                  text = ''
                    if [ "''${1:-}" = "--update-only" ]; then
                      exec ${t3code-nightly.packages.${vars.system}.default}/bin/t3code "$@"
                    fi

                    appimage="''${XDG_DATA_HOME:-$HOME/.local/share}/t3code-nightly/T3-Code.AppImage"
                    if [ ! -x "$appimage" ]; then
                      exec ${t3code-nightly.packages.${vars.system}.default}/bin/t3code "$@"
                    fi

                    export T3CODE_DISABLE_AUTO_UPDATE=1
                    exec appimage-run "$appimage" "$@"
                  '';
                };
                xdg.mimeApps.defaultApplications = {
                  "x-scheme-handler/t3code" = [ "t3code.desktop" ];
                  "x-scheme-handler/t3code-dev" = [ "t3code.desktop" ];
                };
              }
            ];
          extraSpecialArgs = {
            inherit vars nixvim pkgs_32 opencode-desktop-flake zen-browser neonfetch nix-stt redot-flake quickshell-config unstable bun_1_4_2;
          };
        };
    in
    {
      homeConfigurations = {
        hypr-nix = mkHome "hypr-nix" (import ./hosts/hypr-nix/vars.nix);
        hyprtop = mkHome "hyprtop" (import ./hosts/hyprtop/vars.nix);
        hyprpi = mkHome "hyprpi" (import ./hosts/hyprpi/vars.nix);
      };
    };
}
