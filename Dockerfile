FROM ubuntu

RUN apt-get update
RUN apt install -y curl
RUN apt-get -y install tzdata
RUN apt-get -y install apache2
RUN echo "From Github." > /var/www/html/index.html
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
