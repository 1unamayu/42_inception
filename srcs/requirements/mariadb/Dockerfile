# Starting image
FROM debian:oldstable
LABEL maintainer "xamayuel@student.42urduliz.com"

# Install mariadb
RUN apt-get update && apt-get -y install mariadb-server mariadb-client \
	# Remove apt-get update lists
    && rm -rf /var/lib/apt/lists/* 
# Mariadb Directories
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 777 /var/run/mysqld

EXPOSE 3306
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]