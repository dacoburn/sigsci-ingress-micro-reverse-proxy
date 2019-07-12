# Dockerfile example for debian Signal Sciences agent container

FROM httpd:2.4-alpine
MAINTAINER Signal Sciences Corp. 


COPY contrib/www/index.html /usr/local/apache2/htdocs/index.html
COPY contrib/www/signalsciences.png /usr/local/apache2/htdocs/signalsciences.png
COPY contrib/www/signalsciences.png /usr/local/apache2/htdocs/apache/signalsciences.png
COPY contrib/conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY contrib/scripts/start.sh /app/start.sh

#ADD . /app

RUN apk update && apk --no-cache add apr apr-util ca-certificates openssl curl &&  rm -rf /var/cache/apk/* && chmod +x /app/start.sh 
RUN curl https://dl.signalsciences.net/sigsci-module-apache/1.7.9/alpine/3.6/sigsci-module-apache_1.7.9_x86_64.apk > /app/sigsci-module-apache_1.7.9_x86_64.apk  &&  apk add --allow-untrusted /app/sigsci-module-apache_1.7.9_x86_64.apk && rm -rf /app/sigsci-module-apache_1.7.9_x86_64.apk

ENTRYPOINT ["/app/start.sh"]

