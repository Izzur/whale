#!/usr/bin/env bash

sudo podman run --name postgresql \
  -e POSTGRES_USER=$DEFAULT_USER \
  -e POSTGRES_PASSWORD=$DEFAULT_PASS \
  -e POSTGRES_DB=$DEFAULT_DB \
  -p 5432:5432 --rm docker.io/rapidfort/postgresql-official:latest
