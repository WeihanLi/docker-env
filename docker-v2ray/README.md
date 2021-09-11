# Docker v2ray setup

## Prepare

Firstly you need to prepare a nginx config to proxy requests to v2ray

WebSocket with TLS sample nginx config:

``` conf
server {
    listen 443;
    server_name v2ray.weihanli.top;
    sendfile                on;
    tcp_nopush              on;
    tcp_nodelay             on;
    keepalive_requests      25600;
    keepalive_timeout       65;
    
    add_header Strict-Transport-Security "max-age=63072000" always;
    ssl_stapling on;
    ssl_stapling_verify on;

     location /v2ray {
        proxy_redirect off;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;
        proxy_read_timeout 300s;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:9000;
     }
}
```

WebSocket without TLS sample nginx config:

``` conf
server {
    listen 80;
    server_name _;
    
     location /v2ray {
        proxy_redirect off;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;
        proxy_read_timeout 300s;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:9000;
     }
}
```

More configuration examples: <https://github.com/v2fly/v2ray-examples>

## Update v2ray config

Update the `config.json` in v2ray folder, update the 9th line, id value with a guid value, and it will be used when you config the client, and you can config more than one client

## Run docker-compose

When everything is ready, you can run `docker-compose up -d` to start the v2ray service

## Client configuration

1. Download client from the <https://www.v2ray.com/awesome/tools.html>, for windows, download from <https://github.com/2dust/v2rayN>
2. sample client configuration, id is the guid you configured in the `config.json`
  ![client configuration](./images/client-configuration.png)
