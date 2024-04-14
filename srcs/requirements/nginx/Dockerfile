# syntax=docker/dockerfile:1
FROM alpine:3.18

RUN echo -e "\033[1;32mUpdate and install NGINX.\033[0m"
RUN apk update && apk upgrade && apk add --no-cache nginx

RUN echo -e "\033[1;32mEXPOSE PORT 443.\033[0m"
EXPOSE 443
RUN echo -e "\033[1;32mCMD.\033[0m"
CMD ["nginx", "-g", "daemon off;"]