FROM alpine:3

RUN apk add --no-cache rsync bash tar lsblk device-mapper && rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /bin/entrypoint

ENTRYPOINT [ "/bin/entrypoint" ]
