FROM alpine

RUN apk add --no-cache curl

# RUN wget https://api.nife.io/release/install.sh
RUN curl -L https://api.nife.io/release/install.sh | NIFECTL_INSTALL=/usr/local sh


# RUN ["chmod", "+x", "install.sh"]

# RUN sh ./install.sh

COPY entrypoint.sh /entrypoint.sh
COPY nife.toml /nife.toml


RUN apk add dos2unix && dos2unix /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

RUN pwd && ls -ltr

# ENTRYPOINT ["/bin/sh", "-c", "/root/.nife/bin/nifectl $*"]
ENTRYPOINT [ "/entrypoint.sh" ]
