FROM gitpod/workspace-full

USER gitpod
# Install custom tools, runtimes, etc.
# More information: https://www.gitpod.io/docs/config-docker/
RUN cd /home/gitpod && mkdir bin
RUN wget -c https://downloads.dockerslim.com/releases/1.35.1/dist_linux.tar.gz -O - | tar -xz -C /home/gitpod/bin
ENV PATH="$HOME/bin/dist_linux:$PATH"

