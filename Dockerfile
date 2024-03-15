FROM ubuntu 
RUN apt update
RUN apt install apache2 -y
RUN apt install -y apache2-utils
RUN apt install vim -y
COPY index.html /var/www/html
COPY style.css /var/www/html
RUN sed -i '/Listen 80/a\Listen 8081' /etc/apache2/ports.conf
EXPOSE 8081
CMD ["apache2ctl", "-D", "FOREGROUND"]