#!/bin/bash
dockerfile="$1"
shift
docker run --rm -i hadolint/hadolint hadolint "$@" - < "$dockerfile"
