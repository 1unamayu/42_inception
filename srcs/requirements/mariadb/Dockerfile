FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./tools/conf.sh /conf.sh

RUN chmod +x /conf.sh

ENTRYPOINT [ "./conf.sh" ]