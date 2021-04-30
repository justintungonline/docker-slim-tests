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
docker-slim build docker-azure-cli-function-core-tools-dotnet -t docker-azure-cli-function-core-tools-dotnet-slim
docker images

# In separate terminal
# find container web interface to hit it with curl for docker-slim to analyze
docker ps
# get host ip
curl ifconfig.me
curl http://<YOUR_DOCKER_HOST_IP>:<PORT>
# ...

```

# Tests on a Dockerized Azure function

```sh

git clone https://github.com/justintungonline/azure-sa-function-tests.git
cd azure-sa-function-tests
docker build . -t azure-sa-function-tests-dockerized2

# call docker-slim and build image, execute a command on container start up, probe with get as localhost:port/api.HttpExample, wait for a timeout before stopping the container
docker-slim build azure-sa-function-tests-dockerized2 -t azure-sa-function-tests-dockerized2-slim --http-probe-cmd /api/HttpExample --exec "func start --csharp" --continue-after timeout

# In separate terminal
docker ps
# get Docker container id
docker exec -it 742ca277d718 func start --csharp
# ^C after http probes are complete

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
>> docker run -it tutum/curl-slim
