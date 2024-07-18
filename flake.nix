{
    description = "Sparrows.dev static site builder.";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";

        flake-utils = {
            url = "github:numtide/flake-utils";
        };

        particle-theme = {
            url = "github:svavs/particle-zola";
            flake = false;
        };

    };

    outputs = {self,nixpkgs, flake-utils, particle-theme, ...}:

        flake-utils.lib.eachDefaultSystem (system: 
            let 
                pkgs = nixpkgs.legacyPackages.${system};
            in {
            packages = rec {
                default = c4;

                c4 = pkgs.stdenv.mkDerivation {
                    pname = "c4-site";
                    version = "0.1.0";
                    src = ./.;

                    buildInputs = [
                        pkgs.zola
                        pkgs.html-minifier
                    ];

                    buildPhase = ''
                    mkdir -p ./themes/particle-zola            
                    cp -r ${particle-theme}/* themes/particle-zola/

                    zola build --output-dir $out

                    html-minifier --collapse-whitespace \
                                  --remove-comments \
                                  --minify-css true --remove-redundant-attributes \
                                  --remove-script-type-attributes \
                                  --minify-urls String \
                                  --input-dir $out/ --output-dir $out/ --file-ext html
                    '';

                    checkPhase = ''
                    zola check

                    test -f $out/index.html
                    '';
                };
            };
            
            devShells = rec {
                default = worksite;

                worksite = pkgs.mkShell {
                    name = "worksite";
                    nativeBuildInputs = with pkgs; [
                        zola
                    ];
                };
            };
        }
        );
}