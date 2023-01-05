# Squid Proxy Server

## TL;DR

This is a nice proxy, but doesn't help much as conda and node are using https protocol to fetch packages.  This proxy isn't effective for caching https.  It worked great for apt-get.  But for that apt-cacher-ng is a better choice

**TODO: review https**

From : https://github.com/sameersbn/docker-squid

## Running the proxy

run `./run-squid-proxy-docker.sh`

It sets up  `~/tmp/squid-proxy-cache` directory as cache dir

You can watch it

```bash
$    watch "sudo find ~/tmp/squid-proxy-cache | wc -l"
$    watch sudo du -skh ~/tmp/squid-proxy-cache
```

### Watching the logs

```bash
$   docker exec -it squid-proxy tail -f /var/log/squid/access.log
```

## Using it during docker build

Docker already honors proxies according to here : https://docs.docker.com/engine/reference/builder/#predefined-args

So these can be used without using ARG in Dockerfile

First find the proxy IP address. 

```bash
$  docker inspect squid-proxy | grep IPAddress
```

Let's say this IP is `172.17.0.2`

During Docker build

```bash
$   proxy=http://172.17.0.2:3142    \
    docker build  \
           --build-arg http_proxy=$proxy \
           --build-arg https_proxy=$proxy \
           --build-arg ftp_proxy=$proxy \
           . 
```

in Dockerfile

```Dockerfile
# to check if proxy is in effect
RUN echo $http_proxy
```
