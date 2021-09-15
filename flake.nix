{
  description = "Docker container with Wordpress installer";
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    majordomo.url = "git+https://gitlab.intr/_ci/nixpkgs?ref=deploy_postfix";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, majordomo, ... } @ inputs: 
  let
    system = "x86_64-linux";
  in {
    devShell.${system} = with nixpkgs-unstable.legacyPackages.${system}; mkShell {
      buildInputs = [
        nixUnstable
        nixos-rebuild
      ];
      shellHook = ''
        # Fix ssh completion
        # bash: warning: setlocale: LC_CTYPE: cannot change locale (en_US.UTF-8)
        export LANG=C

        . ${nixUnstable}/share/bash-completion/completions/nix
      '';
    };

    packages.${system} = {
      wp-5-8 = import ./container.nix {
        inherit nixpkgs system;
        wp_version = "5.8.1";
      };

      deploy-5-8 = majordomo.outputs.deploy {
        tag = "apps/wordpress";
        pkg_name = "wordpress-5-8";
        postfix = "_5_8";
      };
    };

    defaultPackage.${system} = self.packages.${system}.wordpress-5-8;
  };
}

