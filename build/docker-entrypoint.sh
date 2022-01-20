#!/bin/sh
# docker-entrypoint.sh

# Replace any environment variable in config file
sed -i 's,ENV_INPUT_STREAM_URL,'"$INPUT_STREAM_URL"',g' /etc/ffserver.conf
sed -i 's,ENV_HTTP_PORT,'"$HTTP_PORT"',g' /etc/ffserver.conf
sed -i 's,ENV_RTSP_PORT,'"$RTSP_PORT"',g' /etc/ffserver.conf

# Run the standard container command.
exec "$@"