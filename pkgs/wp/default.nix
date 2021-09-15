{ stdenv, fetchurl, wp_version }:

let
  versionHashMap = {
    "5.7" = "0wcv2q17f3dfrggcsnjki0d993ycmr5rkb9bl61zg1h1zm58rglj";
    "5.8.1" = "sha256-kMqQxK+jfa3IpHQ7XLERsgzaX5g84HPCwL69zmT6gio=";
  };
  version = wp_version;

in stdenv.mkDerivation rec {
  pname = "wordpress";
  inherit version;

  src = fetchurl {
    url = "https://wordpress.org/wordpress-${version}.tar.gz";
    sha256 = versionHashMap."${version}";
  };

  installPhase = ''
    cp -r $src $out 
  '';
}
