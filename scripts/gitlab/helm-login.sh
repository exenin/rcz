#!/bin/bash

gitlab_helm_login() {
    local registry="${1:-registry.gitlab.com}"
    local username="${2:-$GITLAB_USER}"
    local token="${3:-$GITLAB_TOKEN}"
    
    if [ -z "$username" ] || [ -z "$token" ]; then
        log_error "GitLab username and token are required"
        log_info "Usage: gitlab_helm_login [registry] [username] [token]"
        return 1
    fi
    
    log_info "Configuring Helm for GitLab registry: $registry"
    
    # Create helm config directory if it doesn't exist
    mkdir -p "${HOME}/.config/helm"
    
    # Add/Update GitLab Helm repository
    helm repo add gitlab "$registry" \
        --username "$username" \
        --password "$token"
    
    helm repo update
}

export -f gitlab_helm_login 