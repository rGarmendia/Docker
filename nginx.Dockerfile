FROM nginx

COPY hola.html /usr/share/nginx/html

ENV archivo docker

WORKDIR /usr/share/nginx/html

RUN echo "$archivo" > /usr/share/nginx/html/env.html

EXPOSE 90

LABEL version=1

RUN useradd father

USER father

RUN echo "I am your $(whoami)" > /tmp/yo.html

USER root

RUN cp /tmp/yo.html /usr/share/nginx/html

VOLUME /var/log/nginx

CMD nginx -g 'daemon off;'
