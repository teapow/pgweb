# pgweb

This repository simply contains a Dockerfile to build an ARM-compatible image for [pgweb](https://github.com/sosedoff/pgweb), because the image at [hub.docker.io/r/sosedoff/pgweb](https://hub.docker.com/r/sosedoff/pgweb) does not run on a Raspberry Pi.

## Pre-built image

A pre-built image for running pgweb on ARM platforms is available for use on [Docker Hub](https://hub.docker.io/r/teapow/pgweb).

```
teapow/pgweb
```

## Supported environment variables

The pre-built image also supports pgweb configuration via the following environment variables:

| Name            | Default value   | Description                                        |
|-----------------|-----------------|----------------------------------------------------|
| `PGWEB_PGHOST`  | `localhost`     | The hostname of the database server to connect to. |
| `PGWEB_PGPORT`  | `5432`          | The port of the database server to connect to.     |
| `PGWEB_PGDB`    | `postgres`      | The name of the database to connect to.            |
| `PGWEB_PGUSER`  | `postgres`      | The username of the user to connect as.            |
| `PGWEB_PGPASS`  | `postgres`      | The password for the PGWEB_PGUSER.                 |
| `PGWEB_SSLMODE` | `disable`       | The SSL mode. See pgweb docs for more info.        |
