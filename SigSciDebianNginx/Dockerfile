# Dockerfile example for debian Signal Sciences agent container

FROM nginx
MAINTAINER Signal Sciences Corp. 

COPY contrib/html /usr/share/nginx/html
COPY contrib/start.sh /app/start.sh


RUN apt update && apt-get install -y vim sed apt-transport-https wget gnupg && wget -qO - https://apt.signalsciences.net/release/gpgkey | apt-key add - && echo "deb https://apt.signalsciences.net/release/debian/ stretch main" > /etc/apt/sources.list.d/sigsci-release.list && apt-get update && apt-get install nginx-module-sigsci-nxo=1.15.12* && apt-get clean
RUN chmod +x /app/start.sh && sed -i '/\/var\/run\/nginx.pid\;/a load_module /etc/nginx/modules/ndk_http_module.so;' /etc/nginx/nginx.conf && sed -i '/\/var\/run\/nginx.pid\;/a load_module /etc/nginx/modules/ngx_http_sigsci_module.so;' /etc/nginx/nginx.conf && sed -i "s/listen	80;/listen	$SIGSCI_NGINX_PORT;/g" /etc/nginx/conf.d/default.conf && mkdir -p /var/run/sigsci && chmod 777 /var/run/sigsci
WORKDIR /app


ENTRYPOINT ["/app/start.sh"]
