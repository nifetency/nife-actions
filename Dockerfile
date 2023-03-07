FROM alpine

RUN apk add --no-cache curl

RUN curl -L https://api.nife.io/releases/install.sh | sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
