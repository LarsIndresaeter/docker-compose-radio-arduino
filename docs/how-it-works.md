# how it works

- mosquitto : mqtt server
- influxdb : time series database with visualizing
- telegraf : service from influxdb that reads json messages from mqtt broker and
  stores it in the database

