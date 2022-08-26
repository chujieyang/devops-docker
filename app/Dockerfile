FROM python:3.9-alpine
WORKDIR /src
ENV coder=kevinYang
ENV mysql_connection="mysql://appdev:123456@mysql:3306/demo"
COPY . .
RUN apk add build-base gcc musl-dev mariadb-connector-c-dev
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT [ "python", "/src/main.py" ]
EXPOSE 6666