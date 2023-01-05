#!/bin/bash 

cache_dir="$HOME/tmp/squid-proxy-cache"
mkdir -p "$cache_dir"

docker_image="sameersbn/squid:3.5.27-2"
docker_image="sameersbn/squid"   # lastest

docker pull $docker_image

docker rm  squid-proxy
docker run --name squid-proxy -d --restart=always \
    --publish 3142:3142 \
    --volume "${PWD}/squid.conf:/etc/squid/squid.conf" \
    --volume "${cache_dir}:/var/spool/squid" \
    $docker_image
