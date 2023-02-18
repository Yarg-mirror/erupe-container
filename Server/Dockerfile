FROM docker.io/debian:bullseye-slim

RUN mkdir /app
WORKDIR /app
COPY files/ .
RUN chmod +x erupe-ce

EXPOSE 53310/tcp 53312/tcp 54001/tcp 54002/tcp 54003/tcp 54004/tcp 54005/tcp 54006/tcp 54007/tcp 54008/tcp
VOLUME ["/app/bin", "/app/savedata"]

ENTRYPOINT ["./erupe-ce"]