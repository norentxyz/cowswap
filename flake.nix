{
  description = "CoWSwap development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Node.js LTS/Jod (v22.x)
            nodejs_22

            # Yarn classic (v1.x)
            yarn

            # Git for version control
            git

            # Optional: useful dev tools
            jq
          ];

          shellHook = ''
            echo "CoWSwap development environment"
            echo "Node.js: $(node --version)"
            echo "Yarn: $(yarn --version)"
            echo ""
            echo "Run 'yarn install' to install dependencies"
            echo "Run 'yarn build:cowswap' to build the frontend"
          '';
        };
      }
    );
}
