#!/usr/bin/env bash


# -- Prerequisite --
# podman volume create sonarqube_db
# podman volume create sonarqube_data
# podman volume create sonarqube_extensions
# podman volume create sonarqube_logs


sudo sysctl -w vm.max_map_count=524288
# sysctl -w fs.file-max=131072
ulimit -n 131072
# ulimit -u 8192

podman run --name postgres \
  -e POSTGRES_USER=$DEFAULT_USER \
  -e POSTGRES_PASSWORD=$DEFAULT_PASS \
  -e POSTGRES_DB=$DEFAULT_DB \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -v sonarqube_db:/var/lib/postgresql/data \
  --network sonarqube_network \
  -p 5432:5432 --rm docker.io/rapidfort/postgresql-official:latest & \
 \
podman run --name sonarqube \
  -p 9000:9000 \
  -v sonarqube_data:/opt/sonarqube/data \
  -v sonarqube_extensions:/opt/sonarqube/extensions \
  -v sonarqube_logs:/opt/sonarqube/logs \
  --network sonarqube_network \
  -e SONAR_JDBC_URL=jdbc:postgresql://postgres:5432/$DEFAULT_DB \
  -e SONAR_JDBC_USERNAME=$DEFAULT_USER \
  -e SONAR_JDBC_PASSWORD=$DEFAULT_PASS \
  --rm docker.io/library/sonarqube:latest

