# stream2giratksip

This container  handles streaming of any streamable source to Gira TKS IP Gateway

## Running with docker-compose

1. make sure you have docker and docker-compose installed
2. copy docker-compose.yml locally
3. edit the environment variables especially the Stream_URL

```
version: '3'
services:
  stream2giratksip:
    image: toprock/stream2giratksip
    restart: always
    ports:
      - 554:554
      - 8090:8090
    environment:
      INPUT_STREAM_URL: "http://192.168.3.2:9981/stream/channelid/738382740?profile=pass"
      RTSP_PORT: 554
      HTTP_PORT: 8090
```