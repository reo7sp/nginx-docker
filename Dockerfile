FROM nginx
MAINTAINER Oleg Morozenkov

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled && mkdir -p /etc/nginx/sites-enabled
