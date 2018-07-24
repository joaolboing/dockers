FROM ubuntu:16.04

# pgmodeler version
ENV PG_VERSION 0.9.1
ENV BUILD_PKGS "pkg-config build-essential \
        libpq-dev libxml2-dev \
        qt5-qmake qt5-default libqt5svg5-dev"


ADD https://github.com/pgmodeler/pgmodeler/archive/v${PG_VERSION}.tar.gz /usr/local/src/
WORKDIR /usr/local/src
RUN tar xvzf v${PG_VERSION}.tar.gz && rm v${PG_VERSION}.tar.gz

WORKDIR /usr/local/src/pgmodeler-${PG_VERSION}

RUN apt-get update \
    && apt-get install -y $BUILD_PKGS

RUN qmake pgmodeler.pro \
    && make -j $(cat /proc/cpuinfo | grep processor | wc -l) \
    && make install

RUN apt-get remove --purge -y $BUILD_PKGS \
    && rm -rf /var/lib/api/lists/* \
    && mkdir -p /usr/local/lib/pgmodeler/plugins \
    && chmod 777 /usr/local/lib/pgmodeler/plugins


ENTRYPOINT [ "/usr/local/bin/pgmodeler" ] 
