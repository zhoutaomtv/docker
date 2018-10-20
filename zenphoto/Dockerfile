FROM ubuntu:bionic
MAINTAINER Toddy Zhou <zhoutaomtv@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
apt-get install -y curl \
	apache2 \
	libapache2-mod-php \
	php-mysql \
	php-gd \
	php-mbstring && \
apt-get clean && apt-get autoclean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/www/html/* && \
curl -o /zenphoto.tgz https://codeload.github.com/zenphoto/zenphoto/tar.gz/master && \
sed -i "/upload_max_filesize/c\upload_max_filesize = 50M" /etc/php/7.2/apache2/php.ini && \
a2enmod headers && \
a2enmod ssl && \
a2enmod rewrite && \
echo "<Directory /var/www/html>" >> /etc/apache2/sites-available/000-default.conf && \
echo "	AllowOverride All" >> /etc/apache2/sites-available/000-default.conf && \
echo "	Options -Indexes +FollowSymLinks" >> /etc/apache2/sites-available/000-default.conf && \
echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf && \
sed -i "/<\/VirtualHost>/d" /etc/apache2/sites-available/000-default.conf && \
echo "</VirtualHost>" >> /etc/apache2/sites-available/000-default.conf

ADD run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 80 443

CMD ["/bin/bash","/run.sh"]
