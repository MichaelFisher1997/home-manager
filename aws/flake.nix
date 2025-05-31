{
  description = "AWS tools with working EB CLI";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
    in {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          # Make a python env with packaging and pip
          myPythonEnv = pkgs.python312.withPackages (ps: [
            ps.packaging
            ps.setuptools
            ps.pip
          ]);
          # Provide an eb wrapper that pip-installs awsebcli at runtime if needed
          awsebcli = pkgs.writeShellApplication {
            name = "eb";
            runtimeInputs = [ myPythonEnv ];
            text = ''
              # Install awsebcli if it's not already installed
              python3 -m pip show awsebcli >/dev/null 2>&1 || python3 -m pip install --user --no-cache-dir awsebcli
              exec python3 -m ebcli.cli "$@"
            '';
          };
        in {
          awscli2 = pkgs.awscli2;
          awsebcli = awsebcli;
        }
      );
      # Also a devShell for convenience
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.awscli2
              pkgs.python312
            ];
            shellHook = ''
              python3 -m pip install --user --no-cache-dir awsebcli
            '';
          };
        }
      );
    };
}

