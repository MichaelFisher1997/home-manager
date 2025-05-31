{
  description = "AWS tools devshell (with fixed awsebcli overlay)";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      # Overlay to fix awsebcli by adding packaging to its Python env
      awsebcliOverlay = final: prev: {
        awsebcli = prev.python312.withPackages (ps: [
          ps.awsebcli
          ps.packaging
        ]);
      };

      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
    in {
      # <------ THIS IS WHAT HOME-MANAGER EXPECTS ------
      overlays = {
        default = awsebcliOverlay;
      };

      # Optional: expose as devShell
      devShells = forAllSystems (system:
        let pkgs = import nixpkgs {
          inherit system;
          overlays = [ awsebcliOverlay ];
        }; in {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.awscli2
              pkgs.awsebcli
            ];
          };
        }
      );
    };
}

