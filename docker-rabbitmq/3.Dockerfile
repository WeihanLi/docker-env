# https://hub.docker.com/_/rabbitmq
FROM --platform=$TARGETPLATFORM rabbitmq:3-management-alpine

# add customized label
LABEL org.opencontainers.image.authors="weihanli@outlook.com"
LABEL org.opencontainers.image.source="https://github.com/WeihanLi/docker-env"

# rabbitmq plugins https://www.rabbitmq.com/docs/plugins
RUN rabbitmq-plugins enable \
        # management & monitoring
        rabbitmq_management rabbitmq_prometheus \
        # shovel & federation
        rabbitmq_shovel rabbitmq_shovel_management rabbitmq_federation \
        # mqtt
        rabbitmq_mqtt rabbitmq_web_mqtt \
        # stream
        rabbitmq_stream

# enable feature flags https://www.rabbitmq.com/docs/feature-flags
# RUN rabbitmqctl enable_feature_flag all
