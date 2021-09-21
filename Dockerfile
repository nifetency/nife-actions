FROM alpine

RUN apk add --no-cache curl

RUN curl -L https://docs.nife.io/releases/install.sh | NIFECTL_INSTALL=/usr/local sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
