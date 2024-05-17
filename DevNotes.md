# 使用 docker 部署常用的开发环境

## Intro

使用 docker，很多环境可以借助 docker 去部署，没必要所有的环境都在本地安装，十分方便。
前段时间电脑之前返厂修了，回来之后所有的软件都要重新装一遍，很麻烦，有些环境就直接用 docker 部署了，免去了还要再下载软件重新安装的麻烦。


## 部署 SqlServer

docker 部署 SqlServer linux

> password: At least 8 characters including uppercase, lowercase letters, base-10 digits and/or non-alphanumeric symbols

``` sh
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>' -p 1433:1433 --name sqlserver --restart=always -d mcr.microsoft.com/mssql/server:2017-latest
```

如果希望数据持久化，可以挂载数据目录，

``` sh
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>'  --name 'sql1' -p 1401:1433 -v sql1data:/var/opt/mssql -d  mcr.microsoft.com/mssql/server:2019-latest
```

More: <https://mcr.microsoft.com/en-us/product/mssql/server/about>

## 部署 Redis

> 部署普通 Redis

``` sh
docker run --restart=always -d -p 6379:6379 --name redis-server redis:alpine
```

更多：<https://hub.docker.com/_/redis?tab=description>

> 部署 redis-stack

``` sh
docker run --restart=always -d --name redis-stack -p 6379:6379 redis/redis-stack-server:latest
```

with arguments for example `replicaof`

```sh
docker run --restart=always -d -p 6380:6379 -e REDIS_ARGS="--replicaof 10.86.112.141 6379" --name redis-stack-slave redis/redis-stack-server:latest
```

with redis-stack ui

```
docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
```

More:

- https://redis.io/docs/install/install-stack/docker/
- https://redis.io/docs/latest/operate/oss_and_stack/install/install-stack/docker/

## 部署 MySql

``` sh
docker run --restart=always -d -p 3306:3306 --name mysql-server  -e MYSQL_ROOT_PASSWORD=<rootPassword> mysql:8.0
```

挂载配置文件：

``` sh
docker run --restart=always -d -p 3306:3306 --name mysql-server  -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=<rootPassword> mysql:8.0
```

挂载数据库目录

``` sh
docker run --restart=always -d -p 3306:3306 --name mysql-server -v "$PWD/data":/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:8.0
```

更多：[https://hub.docker.com/_/mysql?tab=description](https://hub.docker.com/_/mysql?tab=description)

## 部署 elasticsearch

elasticsearch 一般与 kibana 一起部署，kibana 可以提供一个ui界面方便查询，我们可以使用 docker-compose 部署一个 elasticsearch 和 kibana 实例

``` yaml
version: '2'
services:
  elasticsearch:
    image: elasticsearch:5.6
    container_name: elasticsearch
    ports:
      - 9200:9200
    ulimits:
      nofile:
        soft: 65536
        hard: 65536
    restart: always
    environment:
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m" #specific es java memory
      - "discovery.type=single-node"
    volumes:
      - ./es/data:/usr/share/elasticsearch/data
      - ./es/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
    mem_limit: 1g # memory limit

  kibana:
    image: kibana:5.6
    container_name: kibana
    ports:
      - 5601:5601
    links:
      - elasticsearch:elasticsearch
    depends_on:
      - elasticsearch
    environment:
      ELASTICSEARCH_URL: http://elasticsearch:9200
```

直接使用 docker run 部署：

``` sh
docker run -d -p 9200:9200 -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e "discovery.type=single-node" --name=elasticsearch elasticsearch:5.6-alpine

docker run --name=kibana -d -p 5601:5601 --link elasticsearch:elasticsearch kibana:5.6
```

## 部署 RabbitMQ

docker 部署 RabbitMQ

``` sh
docker run -d --restart=always --name rabbitmq-server -p 5672:5672 -p 15672:15672 weihanli/rabbitmq
```

更多信息：
- [https://hub.docker.com/_/rabbitmq](https://hub.docker.com/_/rabbitmq)
- <https://hub.docker.com/r/weihanli/rabbitmq/tags>

## 部署 MongoDB

docker 部署 MongoDB（无密码配置）

``` sh
docker run -d --restart=always --name mongo-server -p 27017:27017 mongo
```

带密码配置部署

``` sh
docker run -d --restart=always --name mongo-server -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
```

More: <https://hub.docker.com/_/mongo>

## 部署 mdnice

markdown-nice, markdown 文档微信排版工具

```sh
docker run -d --restart=always --name mdnice -p 9000:80 weihanli/mdnice
```

## 部署 wxdh

微信对话生成工具

```sh
docker run -d --restart=always --name wxdh -p 9001:80 weihanli/wxdh
```

## 部署 excalidraw

excalidraw 在线画图工具

```sh
docker run -d --restart=always --name excalidraw -p 9002:80 excalidraw/excalidraw
```
