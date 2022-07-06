FROM alpine:3.8
RUN apk add --no-cache ffmpeg 
COPY ffserver.conf /etc/
COPY docker-entrypoint.sh /usr/bin

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
EXPOSE 554
EXPOSE 8090
CMD ["sh", "-c", "/usr/bin/ffserver -loglevel warning"]