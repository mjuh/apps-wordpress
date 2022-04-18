{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "wordpress-russian";
  version = "5.9.3";

  src = fetchurl {
    url = "https://ru.wordpress.org/wordpress-${version}-ru_RU.tar.gz";
    sha256 = "sha256-qoKuQnR99xBmNof2N0amvOaOo7QricqC8L2kANBiA50=";
  };

  sourceRoot = ".";
  unpackPhase = " ";
  installPhase = ''
    cp -r $src $out
  '';
}
