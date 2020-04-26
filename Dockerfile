FROM alpine:3.10

ENV PGWEB_VERSION 0.11.6

ENV PGWEB_PGHOST localhost
ENV PGWEB_PGPORT 5432
ENV PGWEB_PGDB postgres
ENV PGWEB_PGUSER postgres
ENV PGWEB_PGPASS postgres
ENV PGWEB_SSLMODE disable

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
CMD ["sh", "-c", "/usr/bin/pgweb --bind=0.0.0.0 --listen=8081 --host=${PGWEB_PGHOST} --port=${PGWEB_PGPORT} --db=${PGWEB_PGDB} --user=${PGWEB_PGUSER} --pass=${PGWEB_PGPASS} --ssl=${PGWEB_SSLMODE}"]