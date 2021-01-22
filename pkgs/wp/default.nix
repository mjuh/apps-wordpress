{ stdenv, fetchurl, wp_version }:

let
  versionHashMap = {
    "5.5.3" = "1m5fkgiimrrcii0xm06sbwsz0npkaj830i03bwxmrfjcpxv2cfdi";
    "4.7" = "0xv99p0qkivanfdg5nlwihh0mmrghgr810m55cnswvbif3zjgbky";
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
