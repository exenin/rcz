#!/bin/bash

# Development paths
export DEV_HOME="${HOME}/dev"
export TOOLS_DIR="${DEV_HOME}/tools"
export CONFIG_DIR="${HOME}/.config/rcz"
export CLOUD_CONFIG_DIR="${CONFIG_DIR}/cloud"
export KUBE_CONFIG_DIR="${CONFIG_DIR}/kube"

# Development environment
export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-$EDITOR}"
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export DEVELOPMENT_ENV="${DEVELOPMENT_ENV:-development}"

# Create necessary directories
mkdir -p "${DEV_HOME}" "${TOOLS_DIR}" "${CONFIG_DIR}" "${CLOUD_CONFIG_DIR}" "${KUBE_CONFIG_DIR}"

# Tool-specific environment variables
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Add local bin directories to PATH
export PATH="${HOME}/.local/bin:${PATH}" 