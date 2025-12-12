# docker-compose-radio-arduino

Docker compose files using the docker imaged generated from
[radio-arduino](https://github.com/LarsIndresaeter/radio-arduino)

## user story

> as a entusiast developer I want to store data from a
> [raduino node](https://github.com/LarsIndresaeter/radio-arduino) in a database
> and make data plots

## getting started

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
> It goes without saying that is not a good idea for production.

## how it works

this repository is for local testing

- mosquitto : mqtt server
- influxdb : time series database with visualizing
- telegraf : service from influxdb that reads json messages from mqtt broker and
  stores it in the database

## serial raduino-power-monitor-mqtt

Exposing the serial port to the docker container can be a bit tricky.

```console
sudo chmod a+rw /dev/ttyUSB0
```

This will be done autotatically if you use `toolkit.sh`

