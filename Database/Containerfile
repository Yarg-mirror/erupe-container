FROM docker.io/postgres:15-alpine
ENV POSTGRES_PASSWORD=azerty
RUN mkdir /sql/
COPY sql/*.sql /sql/
COPY scripts/initdb.sh /docker-entrypoint-initdb.d/