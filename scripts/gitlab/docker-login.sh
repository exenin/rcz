#!/bin/bash

gitlab_docker_login() {
    local registry="${1:-registry.gitlab.com}"
    local username="${2:-$GITLAB_USER}"
    local token="${3:-$GITLAB_TOKEN}"
    
    if [ -z "$username" ] || [ -z "$token" ]; then
        log_error "GitLab username and token are required"
        log_info "Usage: gitlab_docker_login [registry] [username] [token]"
        return 1
    fi
    
    log_info "Logging into GitLab registry: $registry"
    echo "$token" | docker login "$registry" -u "$username" --password-stdin
} 