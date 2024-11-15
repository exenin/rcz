#!/bin/bash

setup_paths() {
    log_info "Setting up development paths"

    # Development paths
    export DEV_HOME="${HOME}/dev"
    export TOOLS_DIR="${DEV_HOME}/tools"
    export CONFIG_DIR="${HOME}/.config/rcz"
    export CLOUD_CONFIG_DIR="${CONFIG_DIR}/cloud"
    export KUBE_CONFIG_DIR="${CONFIG_DIR}/kube"
    export SCRIPTS_DIR="${RCZ_HOME}/scripts"

    # Create necessary directories
    mkdir -p "${DEV_HOME}" "${TOOLS_DIR}" "${CONFIG_DIR}" "${CLOUD_CONFIG_DIR}" "${KUBE_CONFIG_DIR}"

    # Add common tool paths to PATH
    export PATH="${TOOLS_DIR}/bin:${PATH}"

    # Add local bin directories if they exist
    [ -d "${HOME}/.local/bin" ] && export PATH="${HOME}/.local/bin:${PATH}"
    [ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

    # Add cargo bin if it exists
    [ -d "${HOME}/.cargo/bin" ] && export PATH="${HOME}/.cargo/bin:${PATH}"

    # Add go bin if it exists
    [ -d "${HOME}/go/bin" ] && export PATH="${HOME}/go/bin:${PATH}"

    # Add npm global bin if it exists
    [ -d "${HOME}/.npm-global/bin" ] && export PATH="${HOME}/.npm-global/bin:${PATH}"

    log_info "Development paths setup completed"
}

source_functions() {
    log_info "Sourcing functions script"

    if [ -f "${SCRIPTS_DIR}/functions.sh" ]; then
        . "${SCRIPTS_DIR}/functions.sh"
        log_info "Sourced functions.sh"
    else
        log_warning "functions.sh not found in ${SCRIPTS_DIR}"
    fi
}

# Execute functions
setup_paths
source_functions
