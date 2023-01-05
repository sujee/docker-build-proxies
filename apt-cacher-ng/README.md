# Apt-Cacher-Ng 
A way to speed up apt-get downloads 

https://github.com/sameersbn/docker-apt-cacher-ng

## Step 1 : Pull docker 
```bash 
    docker pull sameersbn/apt-cacher-ng:3.1-3
```

## Step 2 : Run apt-cache-ng docker 
- Run `start-apt-cache-ng-docker.sh` script in this directory.  
- It will listen on port 3142
- Also it sets up `~/apt-cache-ng` location to store files


## Step 3 : In Dockerfile 
- Copy the script `detect-apt-proxy.sh` in docker build directory
- Add the following snippet in Dockerfile before any apt-get commands
```
## --- caching apt-get downloads ---
##  https://gist.github.com/dergachev/8441335
ARG APT_PROXY_PORT=3142
COPY detect-apt-proxy.sh /root
RUN /root/detect-apt-proxy.sh ${APT_PROXY_PORT}
## --- end : caching apt-get downloads ---
```

## Step 4 : Logs, Debug 

To status see cache status, to go 
	http://localhost:3142/acng-report.html

To see logs 
```bash
    docker exec -it apt-cacher-ng tail -f /var/log/apt-cacher-ng/apt-cacher.log
```

To ssh in 
```bash 
    docker exec -it apt-cacher-ng bash
```
