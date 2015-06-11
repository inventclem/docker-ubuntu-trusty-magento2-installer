#!/bin/sh
cd /var/www/html

rm index.html
git clone -b master git://github.com/magento/magento2.git ./

sed -i "s/\"minimum\-stability\"\:\ \"alpha\"/\"minimum\-stability\"\:\ \"beta\"/g" composer.json

mysql -u root -e "CREATE DATABASE magento2"

composer config repositories.magento composer http://packages.magento.com
composer require magento/sample-data:~0.74.0-beta1

chown -R www-data:www-data /var/www/html \
  && find /var/www/html -type d -exec chmod 700 {} \; \
  && find /var/www/html -type f -exec chmod 600 {} \; \
  && chmod +x /var/www/html/bin/magento

sudo -u www-data ./bin/magento setup:install --use-sample-data --base-url=http://192.168.59.103:8080/ --admin-firstname=Admin --admin-lastname=User --admin-email=dummy@gmail.com --admin-user=admin --admin-password=Password123

chmod 600 /var/www/html/app/etc/config.php /var/www/html/app/etc/env.php
