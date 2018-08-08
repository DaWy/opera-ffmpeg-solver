#!/bin/sh

spruce_type=linux-x64
url=$(curl -s https://api.github.com/repos/iteufel/nwjs-ffmpeg-prebuilt/releases/latest | jq -r ".assets[] | select(.name | test(\"${spruce_type}\")) | .browser_download_url" | cat)
wget ${url}
unzip "${url##*/}"
cp -f ./libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so
rm ./libffmpeg.so
rm "${url##*/}"


