#!/bin/bash 

apt_cache_location=$HOME/apt-cache-ng
mkdir -p $apt_cache_location
docker rm apt-cacher-ng
docker run  --name apt-cacher-ng --init -d --restart=always \
  --publish 3142:3142 \
  --volume "${apt_cache_location}:/var/cache/apt-cacher-ng" \
  sameersbn/apt-cacher-ng:3.1-3
