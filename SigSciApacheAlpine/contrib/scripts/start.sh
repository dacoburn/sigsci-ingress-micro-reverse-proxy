#!/bin/sh

sed -i "s/Listen 8080/Listen $apache_port/g" /usr/local/apache2/conf/httpd.conf
sed -i "s/AgentHost \/var\/run\/sigsci.sock/SigSciAgentHost $sigsci_rpc/g" /usr/local/apache2/conf/httpd.conf

/usr/local/bin/httpd-foreground
#/usr/sbin/apache2 -DFOREGROUND
