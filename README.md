# Docker Build Proxies

When developing docker images, we run builds many many times.  Every time you do `apt update && apt install some-package`  it will download the packages over the internet.  This can be slow even with fast internet speeds.

By using a build proxy, the downloads are cached on local file systems, thus speeding up builds signifantly.

We have two proxies here.

These are both using excellent work from [https://github.com/sameersbn/](https://github.com/sameersbn/)

## apt-cacher-ng

See [apt-cacher-ng/README.md](apt-cacher-ng/README.md)

## squid proxy

See [squid-proxy/README.md](squid-proxy/README.md)

