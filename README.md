[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/justintungonline/docker-slim-tests)

# About Repository
Testing docker-slim to analyze existing containers and minimize them

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
>> docker pull ubuntu:latest
...

>> docker-slim build --target ubuntu:latest --tag ubuntu:curl --http-probe=false --exec "curl checkip.amazonaws.com"
...

>> docker run ubuntu:curl curl checkip.amazonaws.com
...

>> docker images
ubuntu                 curl                ...        ...         17.4MB
ubuntu                 latest              ...        ...         467MB
...
```