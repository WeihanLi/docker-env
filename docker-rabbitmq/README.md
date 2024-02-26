# RabbitMQ

## Run

```sh
docker run -d --restart=always --name rabbitmq-server -p 5672:5672 -p 15672:15672 weihanli/rabbitmq:3.13-management-alpine
```

## References

- <https://hub.docker.com/_/rabbitmq>
- <https://www.rabbitmq.com/docs/admin-guide>
- <https://www.rabbitmq.com/docs/management>
- <https://www.rabbitmq.com/docs/shovel>
- <https://www.rabbitmq.com/docs/stream>
