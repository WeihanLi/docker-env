# https://hub.docker.com/_/rabbitmq
FROM rabbitmq:3-management-alpine

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

LABEL maintainer="weihanli@outlook.com"
LABEL maintainer="github.com/WeihanLi/docker-env"
