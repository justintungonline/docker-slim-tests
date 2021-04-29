[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/justintungonline/docker-slim-tests)

# About Repository
Testing docker-slim to analyze existing containers and minimize them

# tests
```sh

# Pull an image for docker-slim to analyze
$ git clone https://github.com/justintungonline/docker-azure-cli-function-core-tools-dotnet.git
$ 
$ docker-slim build justintungonline/azure-cli-function-core-tools-dotnet:latest

# In separate terminal
# find container web interface to hit it with curl for docker-slim to analyze
docker ps
curl http://<YOUR_DOCKER_HOST_IP>:<PORT>


```