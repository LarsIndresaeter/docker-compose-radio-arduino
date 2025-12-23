# docker-compose examples for radio-arduino

Docker compose files using the docker imaged from
[radio-arduino](https://github.com/LarsIndresaeter/radio-arduino/pkgs/container/radio-arduino)

## user story 1

As a developer I want to store data from a
[raduino node](https://github.com/LarsIndresaeter/radio-arduino) in a database
and make data plots. [mosquitto-influxdb](./mosquitto-influxdb/) example.

### collect data to influxdb running on local machine

Start `mosquitto-influxdb` services:

```console
bash mosquitto-influxdb/toolkit.sh start
```

or

```console
cd mosquitto-influxdb/
docker compose up -d
```

Log in to influxdb

- influxdb url: [localhost:8086](http://localhost:8086)

- **username:** user
- **password:** password1234

> [!WARNING]
> This is a demo. When copying this example you must protect the secrets.

List of services

- mosquitto : mqtt server
- influxdb : time series database with visualizing
- telegraf : service from influxdb that reads json messages from mqtt broker and
  stores it in the database

## user story 2

 As a developer I want to send data from a
[raduino node](https://github.com/LarsIndresaeter/radio-arduino) to a public
mqtt broker. [bridge to test.mosquitto.org](./bridge-to-test.mosquitto.org) example.

### collect data and set up bridge

Start `bridge-to-test.mosquitto.org` services:

```console
bash bridge-to-test.mosquitto.org/toolkit.sh start
```

or

```console
cd bridge-to-test.mosquitto.org/
docker compose up -d
```

