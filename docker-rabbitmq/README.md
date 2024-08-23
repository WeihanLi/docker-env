# RabbitMQ

## Run

docker:

```sh
docker run -d --restart=always --name rabbitmq -p 5672:5672 -p 15672:15672 weihanli/rabbitmq
```

podman:

```sh
podman run -d --restart=always --name rabbitmq -p 5672:5672 -p 15672:15672 weihanli/rabbitmq
```

## References

- <https://github.com/WeihanLi/docker-env/tree/master/docker-rabbitmq>
- <https://hub.docker.com/r/weihanli/rabbitmq/tags>
- <https://hub.docker.com/_/rabbitmq>
- <https://www.rabbitmq.com/docs/admin-guide>
- <https://www.rabbitmq.com/docs/management>
- <https://www.rabbitmq.com/docs/shovel>
- <https://www.rabbitmq.com/docs/stream>
