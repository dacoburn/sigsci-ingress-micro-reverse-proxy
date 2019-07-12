# Dockerfile example for debian Signal Sciences agent container

FROM alpine
MAINTAINER Signal Sciences Corp. 


COPY contrib/sigsci-agent/sigsci-agent /usr/sbin/sigsci-agent
COPY contrib/sigsci-agent/sigsci-agent-diag /usr/sbin/sigsci-agent-diag
COPY contrib/start.sh /app/start.sh

#ADD . /app

RUN apk update && apk --no-cache add apr apr-util ca-certificates openssl curl &&  rm -rf /var/cache/apk/*
RUN chmod +x /usr/sbin/sigsci-agent && chmod +x /usr/sbin/sigsci-agent-diag && chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]

