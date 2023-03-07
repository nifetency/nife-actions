FROM alpine

RUN apk add --no-cache curl

RUN curl -L https://api.nife.io/release/install.sh | sh

RUN ["chmod", "+x", "entrypoint.sh"]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
