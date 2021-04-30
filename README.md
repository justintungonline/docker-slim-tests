[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/justintungonline/docker-slim-tests)

# About Repository
Testing docker-slim to analyze existing containers and minimize them

# From scratch setup

```sh
cd ~
mkdir bin
wget -c https://downloads.dockerslim.com/releases/1.35.1/dist_linux.tar.gz -O - | tar -xz -C ~/bin
export PATH="$HOME/bin/dist_linux:$PATH"
```

# Tests
```sh

# Pull an image for docker-slim to analyze
docker build https://raw.githubusercontent.com/justintungonline/docker-azure-cli-function-core-tools-dotnet/main/Dockerfile -t docker-azure-cli-function-core-tools-dotnet
docker images
docker-slim build docker-azure-cli-function-core-tools-dotnet

# In separate terminal
# find container web interface to hit it with curl for docker-slim to analyze
docker ps
# get host ip
curl ifconfig.me
curl http://<YOUR_DOCKER_HOST_IP>:<PORT>
# ...

```

# Minified Ubuntu Curl image

```sh
>> docker pull tutum/curl
...

>> docker-slim build --target tutum/curl --tag tutum/curl-slim --http-probe=false --exec "curl checkip.amazonaws.com"
...

>> docker run tutum/curl-slim curl checkip.amazonaws.com
...

>> docker images
