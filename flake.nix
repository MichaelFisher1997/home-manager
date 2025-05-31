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
          # Use python312.withPackages, and pip-install awsebcli at build time
          awsebcli-env = pkgs.python312.withPackages (ps: [
            ps.packaging
            ps.setuptools
            ps.pip
          ]);
          awsebcli = pkgs.stdenv.mkDerivation {
            pname = "awsebcli";
            version = "1.0";
            buildInputs = [ awsebcli-env ];
            installPhase = ''
              mkdir -p $out/bin
              export PATH="${awsebcli-env}/bin:$PATH"
              pip install --prefix=$out awsebcli
              # link the eb binary if it was installed somewhere weird
              ln -s $out/bin/eb $out/bin/eb || true
            '';
          };
        in {
          awscli2 = pkgs.awscli2;
          awsebcli = awsebcli;
        }
      );
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.awscli2
              pkgs.python312
            ];
            shellHook = ''
              pip install --no-cache-dir --user awsebcli
            '';
          };
        }
      );
    };
}

