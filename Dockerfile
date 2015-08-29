FROM nginx
MAINTAINER Oleg Morozenkov

COPY nginx-inject-env.sh /usr/libexec/nginx-inject-env.sh
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled && mkdir -p /etc/nginx/sites-enabled

CMD ["sh", "/usr/libexec/nginx-inject-env.sh"]
