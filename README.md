# docker-firetv-server
A firetv-server container - perfect to connect Homeassistant to the FireTV as remote control

## Configuration

### ENVs

- FIRETV
    - host to fire-tv, needs to be set
    - e.g. IP or Hostname

## Usage

Just add the following to your `docker-compose.yml`


```
  firetv-server:
    image: marvambass/firetv-server
    restart: always
    environment:
      FIRETV: fire-tv
    ports:
      - "5556:5556"
```

## Bugfix: Device authentication required, no keys available

Some newer FireTV Sticks have the following problem `Device authentication required, no keys available`.

I found a solution and added a workaround here: https://github.com/happyleavesaoc/python-firetv/issues/49

Connect manually with adb to your firetv stick, trust the device and copy/mount the `adbkey` and `adbkey.pub` to the container beneath `/root/.android/`. After that it will be able to connect to your firetv again.

```
  firetv-server:
    image: marvambass/firetv-server
    restart: always
    environment:
      FIRETV: fire-tv
    ports:
      - "5556:5556"
    volumes:
      - /root/.android:/root/.android:ro
```
