FROM ubuntu:14.04

MAINTAINER Tatsuhiko Kono<kono@takenoko-tech.co.jp>

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install language-pack-ja -y
RUN locale-gen ja_JP.UTF-8
RUN dpkg-reconfigure locales
RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y curl wget build-essential software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get install -y --force-yes php5-cli php5-fpm php5-mysql php5-pgsql php5-sqlite php5-curl\
	php5-gd php5-mcrypt php5-intl php5-imap php5-tidy
RUN apt-get install -y nginx

EXPOSE 80

# configure nginx

RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/php5/fpm/pool.d/www.conf
COPY files/nginx/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf
COPY files/nginx/nginx.conf /etc/nginx/nginx.conf

COPY files/php-fpm/wordpress.conf /etc/php5/fpm/pool.d/

RUN apt-get install unzip -y

ADD files/run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]


