#!/bin/bash
docker pull hadolint/hadolint:latest-alpine
dockerfile="$1"
shift
docker run --rm -i hadolint/hadolint hadolint "$@" - < "$dockerfile"
