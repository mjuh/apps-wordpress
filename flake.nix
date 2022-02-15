{
  description = "WordPress container";

  inputs = {
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    majordomo.url = "git+ssh://git@gitlab.intr/_ci/nixpkgs";
  };

  outputs = { self, flake-utils, nixpkgs, majordomo, ... } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: {
      devShell = with nixpkgs.legacyPackages."${system}"; mkShell {
        buildInputs = [ nixFlakes ];
        shellHook = ''
          . ${nixFlakes}/share/bash-completion/completions/nix
          export LANG=C
        '';
      };
    })
    // (let
      system = "x86_64-linux";
    in
      {
        packages.${system} = {
          container = with nixpkgs.legacyPackages.${system};
            callPackage ./default.nix {};
          deploy = majordomo.outputs.deploy { tag = "apps/wordpress"; };
        };
        defaultPackage.${system} = self.packages.${system}.container;
      });
}
