<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'b200135_forest' );

/** MySQL database username */
define( 'DB_USER', 'u200135_forest' );

/** MySQL database password */
define( 'DB_PASSWORD', '9811255794forest' );

/** MySQL hostname */
define( 'DB_HOST', '78.108.80.175' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '#-l>}(BwP<lu4jx0A/s:emI>rRHac_[!kTt=])kCE_!`Z-9%(Z=H0-c[fOaR.LhI' );
define( 'SECURE_AUTH_KEY',  'znAIdh9Rivs#d|jSO>*IZ)%R`;gL>SJNa@dEA0q/oN.kNz4bpp_3}nme{^MqfD+i' );
define( 'LOGGED_IN_KEY',    'bXLY&.HgtT619ryKugq>1ldhox,}]Ud}Cz8f~(+?+CKiy{O^A>VEs7DdU~Epz=XF' );
define( 'NONCE_KEY',        'q$i>d>euX8Cyqh(A]58jP~n<_;-urh%#wXIXED%%lR}$1R#xKELE?L38^6y[z-`4' );
define( 'AUTH_SALT',        '<K?).#g)gRMU3 ErwV{>J-r_5Oy0C^1-)O7+BifkS<.Si VR L70ouV#Ll]5|-WX' );
define( 'SECURE_AUTH_SALT', '#$wr0BaI1s!Vzmj:I.^+ZWcZPZ>e4sokcls[sK4S}a:=2ZZG;[5hG`U*dN{0*<0.' );
define( 'LOGGED_IN_SALT',   ' kGl/qY=1+4jA:8tEXi**/%6rG3)>&ky_8&+Tgm0/?m-bgU>99&$6S<gqndJ.uNm' );
define( 'NONCE_SALT',       ':`O@{IN=!mnE0D^0z@@}@@M38:Zr?NH5^h+nd[Zh>mK`B`tST7cP:I+ga(b@tD)E' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
