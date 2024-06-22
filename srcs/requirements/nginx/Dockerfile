FROM debian:bullseye

ARG USER_NEW

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
	/etc/nginx/ssl/inception.key -subj "/C=ES/ST=Spain/L=Urduliz/O=42/OU=42/CN=${USER_NEW}.42.fr/UID=${USER_NEW}"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress

#RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]