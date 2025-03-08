echo "waiting for mariadb"
sleep 15

if [ -f "$WP_PATH"/wp-config.php ];
  then
    echo "wordpress is already installed"
  else
    cd "$WP_PATH"
    wp core download --allow-root --locale=fr_FR
    wp config create --allow-root\
                    --dbname="$MYSQL_DATABASE"\
                    --dbuser="$MYSQL_USER"\
                    --dbpass="$MYSQL_PASSWORD"\
                    --dbhost="$MYSQL_DB_NAME"\
                    --dbcharset="utf8"
    wp core install --allow-root\
                    --path="$WP_PATH"\
                    --url="$WP_URL"\
                    --title="$WP_TITLE"\
                    --admin_user="$WP_ADMIN"\
                    --admin_password="$WP_ADMIN_PASSWORD"\
                    --admin_email="$WP_ADMIN_EMAIL"
    wp user create "$WP_USER" "$WP_USER_MAIL"\
                    --allow-root\
                    --path="$WP_PATH"\
                    --user_pass="$WP_USER_PASSWORD"\
                    --display_name="$WP_DISPLAY_NAME"\
                    --role="author"
fi

echo "running php-fpm"
/usr/sbin/php-fpm7.3 -F
