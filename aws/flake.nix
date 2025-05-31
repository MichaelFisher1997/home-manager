{
  description = "Flake with AWS CLI v2 and AWS EB CLI (plus dependencies)";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
    in
    {
      # devShell with both tools installed
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.awscli2
              pkgs.awsebcli
              pkgs.python312Packages.packaging # fixes awsebcli runtime error
            ];
          };
        }
      );

      # Also export as a package set (optional)
      packages = forAllSystems (system: {
        awscli2 = nixpkgs.legacyPackages.${system}.awscli2;
        awsebcli = nixpkgs.legacyPackages.${system}.awsebcli;
      });
    };
}

