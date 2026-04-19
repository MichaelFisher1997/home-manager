{
  description = "Eww bar configuration adapted for Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeManagerModules.default = { config, lib, pkgs, ... }:
        with lib;
        let cfg = config.programs.eww-bar;
        in {
          options.programs.eww-bar = {
            enable = mkEnableOption "eww bar";
            
            package = mkOption {
              type = types.package;
              default = pkgs.eww;
              description = "The eww package to use";
            };
          };

          config = mkIf cfg.enable {
            home.packages = with pkgs; [
              cfg.package
              jq
              socat
              brightnessctl
              curl
              ffmpeg
              pamixer
              playerctl
            ];

            xdg.configFile."eww" = {
              source = ./.;
              recursive = true;
            };
          };
        };

      apps.${system}.default = {
        type = "app";
        program = "${pkgs.writeShellScript "launch-eww" ''
          cd ${toString ./.}
          ./launch_bar
        ''}";
      };

      devShells.${system}.default = pkgs.mkShell {
            packages = with pkgs; [
              eww
              jq
              socat
              brightnessctl
              curl
              ffmpeg
              pamixer
              playerctl
            ];
      };
    };
}
