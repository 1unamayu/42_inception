# Starting image
FROM debian:oldstable
LABEL maintainer "xamayuel@student.42urduliz.com"

# Install Nginx and Openssl
RUN apt-get update \
	&& apt-get -y install nginx \
	openssl \
	# Remove apt-get update lists
    && rm -rf /var/lib/apt/lists/* 
# Generate self certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/xamayuel.42.es.pem -keyout /etc/ssl/xamayuel.42.es.key \
	-subj "/C=ES/ST=SPAIN/L=ZAMUDIO/O=42 School/OU=llescure/CN=xamayuel.42.es"

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]