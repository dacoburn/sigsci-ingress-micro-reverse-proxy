#!/bin/sh


#Get Current agent

curl https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz > sigsci-agent_latest.tar.gz
rm -rf contrib/sigsci-agent/*
cd contrib/sigsci-agent
tar -zxvf ../../sigsci-agent_latest.tar.gz
cd ../../
rm -rf sigsci-agent_latest.tar.gz
