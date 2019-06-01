#!/bin/sh


if [ ! -z $SIGSCI_HOSTNAME ]; then
	export SIGSCI_SERVER_HOSTNAME=$SIGSCI_HOSTNAME-`hostname`
else
	export SIGSCI_SERVER_HOSTNAME=`hostname`
fi

/usr/sbin/sigsci-agent
