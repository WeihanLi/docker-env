# https://hub.docker.com/_/rabbitmq
FROM --platform=$TARGETPLATFORM rabbitmq:4-management-alpine

# add customized label
LABEL maintainer="weihanli@outlook.com"
LABEL repo="github.com/WeihanLi/docker-env"

# rabbitmq plugins https://www.rabbitmq.com/docs/plugins
RUN rabbitmq-plugins enable \
        # management & monitoring(already enabled in management base image)
        # rabbitmq_management rabbitmq_prometheus \
        # shovel & federation
        rabbitmq_shovel rabbitmq_shovel_management rabbitmq_federation \
        # mqtt
        rabbitmq_mqtt rabbitmq_web_mqtt \
        # stream
        rabbitmq_stream
