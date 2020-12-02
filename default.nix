let 
nixpkgs = (import <nixpkgs> { }).fetchgit {
    url = "https://github.com/NixOS/nixpkgs.git";
    rev = "ce9f1aaa39ee2a5b76a9c9580c859a74de65ead5";
    sha256 = "1s2b9rvpyamiagvpl5cggdb2nmx4f7lpylipd397wz8f0wngygpi";
};

# From wp-cli website
# WordPress 3.7 or later. 
# Versions older than the latest WordPress release may have degraded functionality
in rec {
  wp-5-5-3 = import ./container.nix {
    inherit nixpkgs;
    wp_version = "5.5.3";
  };
  wp-4-7 = import ./container.nix {
    inherit nixpkgs;
    wp_version = "4.7";
  };

}
