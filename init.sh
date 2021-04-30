#!/bin/sh
cd ~
mkdir bin
wget -c https://downloads.dockerslim.com/releases/1.35.1/dist_linux.tar.gz -O - | tar -xz -C ~/bin
export PATH="$HOME/bin/dist_linux:$HOME/bin:$PATH"
echo $PATH
