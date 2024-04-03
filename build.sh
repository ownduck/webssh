#!/bin/bash
rm -rf ./webssh/__pycache__
rm -rf webssh.tar webssh.tar.gz
docker build --no-cache -f Dockerfile -t woosau/webssh:1.0 ./
#if [ $? -eq 0 ]; then
#  docker push woosau/webssh:1.0
#fi
docker save -o webssh.tar woosau/webssh:1.0
tar czvf webssh.tar.gz webssh.tar
if [ $? -eq 0 ]; then
  rm -rf webssh.tar
fi