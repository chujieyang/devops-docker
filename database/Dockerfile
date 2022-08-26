FROM alpine:3.9
WORKDIR /src
ENV mysql_connection="mysql://appdev:123456@mysql:3306/demo"
COPY . .
RUN chmod +x entrypoints
RUN apk add mysql-client
ENTRYPOINT [ "/bin/sh", "-c", "/src/entrypoints" ]