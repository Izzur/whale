#!/usr/bin/env bash

podman run --name redis \
  -e REDIS_PASSWORD=$DEFAULT_PASS \
  -p 6379:6379 \
  --rm docker.io/rapidfort/redis

#  --network olympus \
