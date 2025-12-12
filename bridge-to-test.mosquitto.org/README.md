# test.mosquitto.org

## security

By using mosquitto to set up a bridge you can use the broker to handle TLS and
username and password.

## test the local broker and the bridge

subscribe to the local broker

```bash
mosquitto_sub -h localhost -p 1883 -t '#' -v
```

subscribe to the public broker

```bash
mosquitto_sub -h test.mosquitto.org -p 1883 -t 'radio-arduino/#' -v
```

try to publish a message

```bash
mosquitto_pub -h localhost -p 1883 -t 'radio-arduino/test' -m '1337'
```

