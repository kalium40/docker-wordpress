FROM ubuntu:14.04

MAINTAINER Tatsuhiko Kono<kono@takenoko-tech.co.jp>

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install language-pack-ja -y
RUN locale-gen ja_JP.UTF-8
RUN dpkg-reconfigure locales
RUN echo "Asia/Tokyo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
    apt-get -y install mysql-server


RUN sed -i -e "s/^bind-address\s*=\s*\(.*\)/#bind-address = \1/" /etc/mysql/my.cnf

RUN sed -i -e "s/\(\[mysqld\]\)/\1\ncharacter-set-server = utf8/g" /etc/mysql/my.cnf
RUN sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf
RUN sed -i -e "s/\(\[mysqldump\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf
RUN sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf


# 一度MySQLサーバを起動し、外部から接続した際の権限を設定する。
RUN mysqld_safe & \
    sleep 10 && \
    echo "grant all on *.* to root identified by 'root' with grant option;\
    create database wordpress;\
    grant all on wordpress.* to wordpress identified by 'wordpress' with grant option;" | mysql -uroot -proot
EXPOSE 3306

ENTRYPOINT ["mysqld_safe"]


