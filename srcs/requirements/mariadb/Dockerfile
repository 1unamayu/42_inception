FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY tools/conf.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/conf.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/conf.sh"]