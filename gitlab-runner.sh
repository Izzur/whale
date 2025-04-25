#!/usr/bin/env bash

podman run -v gitlab-runner-config:/etc/gitlab-runner --name "gitlab-runner-autocontainer" \
  --rm docker.io/gitlab/gitlab-runner:alpine run \
  # --non-interactive \
  # --url "https://gitlab.com/" \
  # --token "$RUNNER_TOKEN" \
  # --executor "docker" \
  # --docker-image alpine:latest \
  # --description "gitlab-runner-autocontainer"

