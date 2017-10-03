# docker-firetv-server
A firetv-server container - perfect to connect Homeassistant to the FireTV as remote control

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
