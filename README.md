# docker-compose-radio-arduino

Demo of radio-arduino collecting data in a database and making data plots.

## getting started

Shortcut to common commands: `./mosquitto-influxdb/toolkit.sh`.

| parameter | command              | description    |
| --------- | -------------------- | -------------- |
| start     | docker compose up -d | start services |
| stop      | docker compose down  | stop services  |

After starting the service you can log in to influxdb

- influxdb url: [localhost:8086](http://localhost:8086)
- **username:** user
- **password:** password1234

## more information

Docker compose files using the

- Docker images are downloaded from
  [dockerhub](https://hub.docker.com/r/lars32/radio-arduino/)
- Documentation of [radio-arduino on github](https://github.com/LarsIndresaeter/radio-arduino/)

