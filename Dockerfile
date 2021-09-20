FROM alpine

RUN apk add --no-cache curl

RUN curl -L http://ui.apps.nifetency.com/install.sh | NIFECTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
