{
  description = "Home Manager configuration of micqdf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cursor-flake.url = "github:MichaelFisher1997/cursor-cli-flake";
    windsurf-flake.url = "github:MichaelFisher1997/windsurf-flake";
    droid-flake.url = "github:MichaelFisher1997/droid-flake";
    opencode-desktop-flake.url = "github:OpenStaticFish/opencode-desktop-flake";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, cursor-flake, windsurf-flake, droid-flake, opencode-desktop-flake, zen-browser, ... }:
    let
      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs_32 = nixpkgs.legacyPackages.i686-linux;
    in
    {
      homeConfigurations."micqdf" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          nixvim = nixvim;
          pkgs_32 = pkgs_32;
          cursor-flake = cursor-flake;
          windsurf-flake = windsurf-flake;
          droid-flake = droid-flake;
          opencode-desktop-flake = opencode-desktop-flake;
          zen-browser = zen-browser;
          unstable = pkgs;
        };
      };
    };
}

