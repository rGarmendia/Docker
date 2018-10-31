FROM centos

MAINTAINER rgarmendia

LABEL  vendor="yo"

RUN yum install httpd  -y

ENV contenido prueba

WORKDIR /var/www/html

ADD hola.html .

RUN echo "$(whoami)" > /var/www/html/user1.html

RUN useradd ricardo

USER ricardo

RUN echo "$(whoami)" > /tmp/user2.html

VOLUME /var/www/html

USER root

RUN cp /tmp/user2.html /var/www/html/user2.html

WORKDIR /

COPY run.sh ./run.sh

CMD sh ./run.sh
