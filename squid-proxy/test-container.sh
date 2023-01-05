#!/bin/bash 

# run a barebones ubuntu machine
docker run -it --env http_proxy="http://172.17.0.1:3142"  --env DEBIAN_FRONTEND=noninteractive  --env DEBCONF_NONINTERACTIVE_SEEN=true  ubuntu  bash
