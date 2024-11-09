#!/bin/bash

gitlab_admin_token() {
    local gitlab_url="${1:-${GITLAB_URL}}"
    local admin_user="${2:-${GITLAB_ADMIN_USER}}"
    local admin_password="${3:-${GITLAB_ADMIN_PASSWORD}}"
    
    if [ -z "$gitlab_url" ] || [ -z "$admin_user" ] || [ -z "$admin_password" ]; then
        log_error "GitLab URL, admin username and password are required"
        log_info "Usage: gitlab_admin_token <gitlab_url> <admin_user> <admin_password>"
        return 1
    fi
    
    log_info "Getting admin token from GitLab: $gitlab_url"
    
    curl -s --request POST "${gitlab_url}/oauth/token" \
         --data-urlencode "grant_type=password" \
         --data-urlencode "username=${admin_user}" \
         --data-urlencode "password=${admin_password}" \
         | jq -r '.access_token'
}

if [ -n "$BASH_VERSION" ]; then
    export -f gitlab_admin_token
fi
