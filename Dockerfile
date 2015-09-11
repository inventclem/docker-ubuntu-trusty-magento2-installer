FROM markoshust/ubuntu-trusty-lamp
MAINTAINER Mark Shust <mark@shust.com>
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt-get update -y
RUN apt-get install -y \
  curl \
  git \
  php5-cli \
  php5-curl \
  php5-gd \
  php5-intl \
  php5-mcrypt \
  php5-xsl \
  php5-mhash \
  sendmail
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN a2enmod rewrite
RUN echo "ServerName 192.168.59.103" >> /etc/apache2/apache2.conf 
COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN sed -i "s/\;always_populate_raw_post_data/always_populate_raw_post_data/g" /etc/php5/apache2/php.ini
COPY ./install-magento2.sh /
RUN chmod +x /install-magento2.sh
CMD service mysql start \
  && service apache2 start \
  && /bin/bash
