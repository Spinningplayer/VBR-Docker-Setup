#!/bin/bash

echo "installing Docker"
curl -sSL https://get.docker.com/ | sh

echo "installing docker compose"
curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose