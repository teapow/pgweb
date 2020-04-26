FROM alpine:3.10

ENV PGWEB_VERSION 0.11.6

RUN \
  apk update && \
  apk add --no-cache ca-certificates openssl postgresql wget && \
  update-ca-certificates && \
  rm -rf /var/cache/apk/* && \
  cd /tmp && \
  wget -q https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_arm_v5.zip && \
  unzip pgweb_linux_arm_v5.zip -d /usr/bin && \
  mv /usr/bin/pgweb_linux_arm_v5 /usr/bin/pgweb && \
  rm -f pgweb_linux_arm_v5.zip

EXPOSE 8081
CMD ["/usr/bin/pgweb", "--bind=0.0.0.0", "--listen=8081"]