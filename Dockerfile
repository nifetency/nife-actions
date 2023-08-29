FROM alpine

RUN apk add --no-cache curl

RUN wget https://api.nife.io/release/install.sh

RUN ["chmod", "+x", "install.sh"]

RUN sh ./install.sh

# COPY entrypoint.sh /entrypoint.sh

# RUN ["chmod", "+x", "/entrypoint.sh"]

# RUN pwd && ls -ltr

ENTRYPOINT ["/bin/sh", "-c", "/root/.nife/bin/nifectl $*"]
