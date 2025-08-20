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
  };

  outputs = { nixpkgs, home-manager, nixvim, cursor-flake, windsurf-flake, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs_32 = nixpkgs.legacyPackages.i686-linux;
    in
    {
      homeConfigurations."micqdf" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          nixvim = nixvim;
          pkgs_32 = pkgs_32;
          cursor-flake = cursor-flake;
          windsurf-flake = windsurf-flake;
          unstable = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        };
      };
    };
}

