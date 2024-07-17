# docker-ssr

使用 Docker 部署 Shadowsocks 服务端

## BBR加速

部分VPS厂商如搬瓦工的机器已默认开启BBR加速，你可执行 `lsmod | grep bbr` 命令查看，如果结果中有 `tcp_bbr` 的话表示已开启BBR，没有可手动执行以下命令开启。

```sh
echo "net.core.default_qdisc=fq" | sudo tee --append /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee --append /etc/sysctl.conf
sudo sysctl -p
```

## 安装 docker

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
```

## 安装Docker Compose

```sh
compose_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
sudo curl -L "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## 部署 shadowsocks

```sh
docker-compose up -d
```
