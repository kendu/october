#
#       .
#        ":"
#      ___:____     |"\/"|
#    ,'        `.    \  /
#    |  O        \___/  |
#  ~^~^~^~^~^~^~^~^~^~^~^~^~

# The php-fpm container

FROM ubuntu:latest
MAINTAINER DevOps <devops@kendu.si>

ENV DEBIAN_FRONTEND noninteractive

# Set locales.
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN dpkg-reconfigure locales

# Use Ondřej Surý's PHP 5.6 packages
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main " \
       > /etc/apt/sources.list.d/ondrej.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C
RUN apt-get update -y

# Instaling package and clean up the mess
RUN apt-get -y install \
        php5=5.6.* \
        php5-fpm \
        php5-common \
        php5-curl \
        php5-gmp \
        php5-imagick \
        php5-intl \
        php5-json \
        php5-mcrypt \
        php5-memcache \
        php5-pgsql \
        php5-readline \
        php5-sqlite \
        php5-xdebug \
    && \
    apt-get clean

RUN php5enmod mcrypt

RUN rm /etc/php5/fpm/pool.d/www.conf


# ##############################################################################
# CLI Part:

# Split this into two containers later on
RUN apt-get -y install \
       wget \
       git \
       php5-cli \
       php5-readline \
    && \
    apt-get clean

RUN wget -qO /usr/local/bin/composer https://getcomposer.org/composer.phar && \
    chmod +x /usr/local/bin/composer

WORKDIR /opt/web

# FPM
EXPOSE 9000

CMD php5-fpm --fpm-config=/etc/php5/fpm/php-fpm.conf \
             --force-stderr \
             -c /etc/php5/fpm/php.ini
