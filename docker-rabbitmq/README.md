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

## Build container image

> Need to enabled containered image to enable build multi-platform images, see <https://docs.docker.com/desktop/containerd/#enable-the-containerd-image-store>

```sh
# remove the existing image cache to pull latest image
docker rmi weihanli/rabbitmq
docker rmi weihanli/rabbitmq:4
# build image
docker build --platform linux/amd64,linux/arm64,linux/arm -t weihanli/rabbitmq -t weihanli/rabbitmq:4 .
# push image all tags
docker push weihanli/rabbitmq -a
```

## References

- <https://github.com/WeihanLi/docker-env/tree/master/docker-rabbitmq>
- <https://hub.docker.com/r/weihanli/rabbitmq/tags>
- <https://hub.docker.com/_/rabbitmq>
- <https://www.rabbitmq.com/docs/admin-guide>
- <https://www.rabbitmq.com/docs/management>
- <https://www.rabbitmq.com/docs/shovel>
- <https://www.rabbitmq.com/docs/stream>
- <https://docs.docker.com/desktop/containerd/#enable-the-containerd-image-store>
