FROM ubuntu:22.04
RUN apt-get update -y &&  apt-get install nginx -y &&  apt-get install vim -y
WORKDIR /etc/nginx/conf.d
COPY ./exercise.conf /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

