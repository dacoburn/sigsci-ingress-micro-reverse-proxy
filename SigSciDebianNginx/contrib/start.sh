#!/bin/sh

grep -q $SIGSCI_SOCKET /etc/nginx/nginx.conf
RET=$?

if [ ! -z $SIGSCI_SOCKET ] && [ $RET -ne 0 ]; then
	echo $SIGSCI_SOCKET
	sed -i "/http {/a 	sigsci_agent_host	$SIGSCI_SOCKET;" /etc/nginx/nginx.conf
fi

grep -q $SIGSCI_NGINX_PORT /etc/nginx/conf.d/default.conf
RET=$?

if [ ! -z $SIGSCI_NGINX_PORT ] && [ $RET -ne 0 ]; then
	echo $SIGSCI_NGINX_PORT
	sed -i "s/80;/$SIGSCI_NGINX_PORT;/g" /etc/nginx/conf.d/default.conf
fi

nginx -g 'daemon off;'
