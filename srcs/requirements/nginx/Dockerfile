FROM debian:bullseye

ARG USER_NEW
ARG CERTIFICATES_KEY
ARG CERTIFICATES_CRT
ARG DOMAIN

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends nginx openssl gettext && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out ${CERTIFICATES_CRT} -keyout \
	${CERTIFICATES_KEY} -subj "/C=ES/ST=Spain/L=Urduliz/O=42/OU=42/CN=${USER_NEW}.42.fr/UID=${USER_NEW}"

COPY ./conf/nginx.conf.template /etc/nginx/nginx.conf.template

RUN mkdir -p /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress

RUN envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]