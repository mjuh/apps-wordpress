{
  description = "WordPress container";

  inputs = {
    majordomo.url = "git+ssh://git@gitlab.intr/_ci/nixpkgs";
    containerImageApache.url = "git+https://gitlab.intr/webservices/apache2-php74.git";
  };

  outputs = { self, nixpkgs, majordomo, ... } @ inputs:
    let
      system = "x86_64-linux";
      tests = { driver ? false }: with nixpkgs.legacyPackages.${system}; { } // (with nixpkgs.legacyPackages.${system}.lib;
        listToAttrs (map
          (test: nameValuePair "wordpress-${test.name}" (if driver then test.driver else test))

          (import ./tests.nix {
            inherit (majordomo.outputs) nixpkgs;
            inherit (import majordomo.inputs.nixpkgs {
              inherit system;
              overlays = [ majordomo.overlay ];
            }) maketestCms;
            containerImageCMS = self.packages.${system}.container;
            containerImageApache = inputs.containerImageApache.packages.${system}.container;
          }
          )
        )
      );
    in
    {
      devShell.${system} = with nixpkgs.legacyPackages.${system}; mkShell {
        buildInputs = [ nixFlakes ];
        shellHook = ''
          # Fix ssh completion
          # bash: warning: setlocale: LC_CTYPE: cannot change locale (en_US.UTF-8)
          export LANG=C

          . ${nixFlakes}/share/bash-completion/completions/nix
        '';
      };

      packages.${system} = with nixpkgs.legacyPackages.${system}; {
        container = callPackage ./default.nix {
          wp = callPackage ./pkgs/wordpress-russian { };
        };
        deploy = majordomo.outputs.deploy {
          tag = "apps/wordpress";
        };
      } // (tests { driver = true; });

      defaultPackage.${system} = self.packages.${system}.container;
      checks.${system} = tests { };
      apps.${system}.vm = {
        type = "app";
        program = "${self.packages.${system}.wordpress-vm-test-run-wordpress-mariadb-nix-upstream}/bin/nixos-run-vms";
      };
    };
}
