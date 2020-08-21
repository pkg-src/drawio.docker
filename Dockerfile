FROM ubuntu:20.04

ENV DRAWIO_VERSION 13.6.2

RUN set -e -u -x; \
    apt update; apt -y upgrade; \
    DEBIAN_FRONTEND=noninteractive apt -y install \
        curl xvfb nano libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libappindicator3-1 libsecret-1-0 libgbm1; \
    curl -LJO "https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/draw.io-x86_64-${DRAWIO_VERSION}.AppImage"; \
    chmod a+x "draw.io-x86_64-${DRAWIO_VERSION}.AppImage"; \
    "./draw.io-x86_64-${DRAWIO_VERSION}.AppImage" --appimage-extract; \
    rm "draw.io-x86_64-${DRAWIO_VERSION}.AppImage"

COPY entrypoint /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint"]
