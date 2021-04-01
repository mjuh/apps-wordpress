{ nixpkgs,
  wp_version
}:

with import nixpkgs { };
let
  wp = callPackage ./pkgs/wp { wp_version = wp_version; };

  configCommand = builtins.concatStringsSep " " [
    "${wp-cli}/bin/wp core config"
    "--locale=ru_RU"
    "--dbname=$DB_NAME"
    "--dbuser=$DB_USER"
    "--dbpass=$DB_PASSWORD"
    "--dbhost=$DB_HOST"
  ];

  installCommand = builtins.concatStringsSep " " [
    "${wp-cli}/bin/wp core install"
    "--url=$DOMAIN_NAME"
    "--title=\"$APP_TITLE\""
    "--admin_user=$ADMIN_USERNAME"
    "--admin_password=$ADMIN_PASSWORD"
    "--skip-email"
    "--admin_email=$ADMIN_EMAIL"
  ];

  entrypoint = (stdenv.mkDerivation rec {
    name = "wp-install";
    builder = writeScript "builder.sh" (''
      source $stdenv/setup
      mkdir -p $out/bin

      cat > $out/bin/${name}.sh <<'EOF'
      #!${bash}/bin/bash
      set -ex
      export PATH=${gnutar}/bin:${coreutils}/bin:${gzip}/bin:${mariadb.client}/bin

      echo "Extract installer archive."
      tar -xf ${wp} --strip 1

      echo "Install."
      ${configCommand}
      ${installCommand}

      ${wp-cli}/bin/wp language core install ru_RU
      ${wp-cli}/bin/wp language core activate ru_RU

      ${mariadb.client}/bin/mysql -h$DB_HOST -u$DB_USER -p$DB_PASSWORD $DB_NAME -e "CREATE INDEX autoload ON wp_options(autoload)"
      EOF

      chmod 555 $out/bin/${name}.sh
    '');
  });

in pkgs.dockerTools.buildLayeredImage rec {
  name = "docker-registry.intr/apps/wordpress";
  tag = "latest";

  contents = [ bashInteractive coreutils gnutar gzip entrypoint mariadb.client ];
  config = {
    Entrypoint = "${entrypoint}/bin/wp-install.sh";
    Env = [
      "TZ=Europe/Moscow"
      "TZDIR=${tzdata}/share/zoneinfo"
      "LOCALE_ARCHIVE_2_27=${glibcLocales}/lib/locale/locale-archive"
      "LOCALE_ARCHIVE=${glibcLocales}/lib/locale/locale-archive"
      "LC_ALL=en_US.UTF-8"
      "SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
    ];
    WorkingDir = "/workdir";
  };
  extraCommands = ''
    mkdir -p usr/bin
    ln -s ${coreutils}/bin/ln usr/bin/env
  '';
}
