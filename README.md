# stream2giratksip

This container  handles streaming of any streamable video source to Gira TKS IP Gateway

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

This will give you two outputs
```
#mpeg4 rtp stream 640x480 
http://IPofDockerHost:8090/s0 

#jpeg output 
http://IPofDockerHost:8090/s0.jpg

```

## Camera Types

### Unifi 

For Unifi Cameras you need to change the Stream_URL and adapt the protocol and port from e.g. rtsps://192.168.1.1:7441/asdfasdfew22?enableSrtp to rtsp://192.168.1.1:7447/asdfasdfew22?enableSrtp