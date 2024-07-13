{
    description = "C4's static site builder.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";

        flake-utils = {
            url = "github:numtide/flake-utils";
        };

        bulma = {
            url = "github:jgthms/bulma";
            flake = false;
        };
    };

    outputs = {self,nixpkgs, flake-utils, bulma, ...}:

        flake-utils.lib.eachDefaultSystem (system: 
            let 
                pkgs = nixpkgs.legacyPackages.${system};
            in {
            
            devShells = rec {
                default = worksite;

                worksite = pkgs.mkShell {
                    name = "worksite";
                    nativeBuildInputs = with pkgs; [
                        zola
                        linkchecker
                        just
                    ];
                };
            };
        }
        );
}