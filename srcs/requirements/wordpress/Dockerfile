FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client netcat 
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/conf.sh /

RUN chmod +x conf.sh

ENTRYPOINT [ "./conf.sh" ]