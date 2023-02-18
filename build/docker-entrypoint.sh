#!/bin/sh
# docker-entrypoint.sh

# Replace any environment variable in config file
sed -i 's,ENV_INPUT_STREAM_URL,'"$INPUT_STREAM_URL"',g' /etc/ffserver.conf
sed -i 's,ENV_INPUT_STREAM_URL1,'"$INPUT_STREAM_URL1"',g' /etc/ffserver.conf
if [ $HTTP_PORT ]
then
    sed -i 's,ENV_HTTP_PORT,'"$HTTP_PORT"',g' /etc/ffserver.conf
else
    sed -i 's,ENV_HTTP_PORT,8090,g' /etc/ffserver.conf
fi
if [ $RTSP_PORT ]
then
    sed -i 's,ENV_RTSP_PORT,'"$RTSP_PORT"',g' /etc/ffserver.conf
else
    sed -i 's,ENV_RTSP_PORT,554,g' /etc/ffserver.conf
fi
# Run the standard container command.
exec "$@"