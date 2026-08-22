{
  description = "Home Manager configuration of micqdf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    windsurf-flake = {
      url = "github:MichaelFisher1997/windsurf-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    droid-flake = {
      url = "github:MichaelFisher1997/droid-flake";
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
    modal-flake = {
      url = "github:OpenStaticFish/modal-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-tts = {
      url = "github:OpenStaticFish/nix-tts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nixvim, windsurf-flake, droid-flake, opencode-desktop-flake, t3code-nightly, zen-browser, neonfetch, modal-flake, nix-tts, ... }:
    let
      mkHome = hostName: vars:
        let
          pkgs = import nixpkgs {
            inherit (vars) system;
            config.allowUnfree = true;
          };
          unstable = import nixpkgs-unstable {
            inherit (vars) system;
            config.allowUnfree = true;
          };
          bun_1_4_0 =
            let
              sources = {
                "aarch64-linux" = {
                  url = "https://github.com/oven-sh/bun/releases/download/bun-v1.4.0/bun-linux-aarch64.zip";
                  hash = "sha256-SxozLuhhmD65O8/m93D/+U4+MbLDiL2uo8jtNeWO7Q4=";
                };
                "x86_64-linux" = {
                  url = "https://github.com/oven-sh/bun/releases/download/bun-v1.4.0/bun-linux-x64.zip";
                  hash = "sha256-LQP7X7g6yLVnrKCigbLOGhoZ1Ij1bClo2Iw/Jekv5FI=";
                };
              };
            in
            unstable.bun.overrideAttrs (_: {
              version = "1.4.0";
              src = unstable.fetchurl (
                sources.${vars.system} or (throw "Unsupported Bun system: ${vars.system}")
              );
            });
          pkgs_32 = nixpkgs.legacyPackages.i686-linux;
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/${hostName}/default.nix ]
            ++ nixpkgs.lib.optionals (hostName == "hypr-nix") [
              t3code-nightly.homeManagerModules.default
              {
                programs.t3code-nightly.enable = true;
              }
            ];
          extraSpecialArgs = {
            inherit vars nixvim pkgs_32 windsurf-flake droid-flake opencode-desktop-flake zen-browser neonfetch modal-flake nix-tts unstable bun_1_4_0;
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
