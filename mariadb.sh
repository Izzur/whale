#!/usr/bin/env bash

sudo podman run --name mariadb \
  -e MARIADB_ROOT_PASSWORD=$DEFAULT_PASS \
  -e MARIADB_USER=$DEFAULT_USER \
  -e MARIADB_PASSWORD=$DEFAULT_PASS \
  -e MARIADB_DATABASE=common \
  -p 3306:3306 --rm docker.io/rapidfort/mariadb
