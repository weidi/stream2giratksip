# stream2giratksip

This container  handles streaming of any streamable video source to Gira TKS IP Gateway.
Images are provided for armv7 arm64 and amd64 so it should fit most needs

## Environment Variables

Please use the three provided environment variables to configure the container.
- INPUT_STREAM_URL: "http://192.168.3.2:9981/stream/channelid/738382740?profile=pass"
- RTSP_PORT: 554 (optional with latest image)
- HTTP_PORT: 8090 (optional with latest image)

## Running with docker-compose

1. make sure you have docker and docker-compose installed
2. copy docker-compose.yml locally
3. edit the environment variables especially the Stream_URL

```
version: '3'
services:
  stream2giratksip:
    image: toprock/stream2giratksip:latest
    restart: always
    ports:
      - 554:554
      - 8090:8090
    environment:
      #output to /s0(.jpg)
      INPUT_STREAM_URL: "rtsp://192.168.1.1:7447/abdDEFCG?enableSrtp"
      #Output to /s1(.jpg)
      INPUT_STREAM_URL1: "rtsp://192.168.1.1:7447/gwRB95w1OVH5MnjS?enableSrtp"
      RTSP_PORT: 554
      HTTP_PORT: 8090
```

4. run compose file by using docker-compose up or docker-compose up -d


This will give you four outputs
```
#mpeg4 rtp stream 640x480 from INPUT_STREAM_URL
http://IPofDockerHost:8090/s0 

#jpeg output from INPUT_STREAM_URL
http://IPofDockerHost:8090/s0.jpg

#mpeg4 rtp stream 640x480 from INPUT_STREAM_URL1
http://IPofDockerHost:8090/s1 

#jpeg output from INPUT_STREAM_URL1
http://IPofDockerHost:8090/s1.jpg


```

## Running with docker run
This will give you same result as using the docker compose file

```
docker run -e RTSP_PORT=554 -e HTTP_PORT=8090 -e INPUT_STREAM_URL="http://192.168.3.2:9981/stream/channel.m4a" -p 554:554 -p 8090:8090 toprock/stream2giratksip:1.0.4
```


## Camera Types

### Unifi 

For Unifi Cameras you need to change the Stream_URL and adapt the protocol and port from e.g. rtsps://192.168.1.1:7441/asdfasdfew22?enableSrtp to rtsp://192.168.1.1:7447/asdfasdfew22?enableSrtp
