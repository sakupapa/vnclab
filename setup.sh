#!/usr/bin/bash

docker build -t vnc-desktop:bookworm -f Dockerfile.vnc . 
docker build -t nginx:1.0 -f Dockerfile.nginx .
docker build -t coredns:1.0 -f Dockerfile.coredns .
