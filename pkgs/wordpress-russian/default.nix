{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "wordpress-russian";
  version = "6.0";

  src = fetchurl {
    url = "https://ru.wordpress.org/wordpress-${version}-ru_RU.tar.gz";
    sha256 = "sha256-yN8F7vxdZuAgnYRT2WRufxigKpCrttjLY8ovyDA1IYw=";
  };

  sourceRoot = ".";
  unpackPhase = " ";
  installPhase = ''
    cp -r $src $out
  '';
}
