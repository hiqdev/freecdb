FROM alpine

RUN apk add --no-cache --virtual .build-deps \
        git musl-dev gcc linux-headers make \
    && git clone https://git.launchpad.net/ubuntu/+source/freecdb \
    && cd freecdb \
    && make all \
    && mv cdbmake cdbdump cdbget cdbstats /usr/bin \
    && make clean \
    && cd ../ && rm -rf freecdb \
    && apk del .build-deps



