FROM alpine

ENV PGWEB_VERSION 0.11.6

RUN apt-get update && \
    apt-get install --yes wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    cd /tmp && \
    wget --quiet https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_arm_v5.zip && \
    unzip pgweb_linux_arm_v5.zip -d /usr/bin && \
    mv /usr/bin/pgweb_linux_arm_v5 /usr/bin/pgweb && \
    rm --force pgweb_linux_arm_v5.zip

RUN useradd --create-home --shell=/bin/bash pgweb

USER pgweb
WORKDIR /app

EXPOSE 8081
CMD ["/usr/bin/pgweb", "--bind=0.0.0.0", "--listen=8081"]