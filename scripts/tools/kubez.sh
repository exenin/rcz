#!/bin/bash

# Kubernetes helper functions
k8s_context() {
    local context="$1"
    if [ -z "$context" ]; then
        kubectl config get-contexts
        return
    fi
    kubectl config use-context "$context"
}

k8s_namespace() {
    local namespace="$1"
    if [ -z "$namespace" ]; then
        kubectl get namespaces
        return
    fi
    kubectl config set-context --current --namespace="$namespace"
}

k8s_pods() {
    local namespace="${1:-default}"
    kubectl get pods -n "$namespace" "$@"
}

k8s_logs() {
    local pod="$1"
    local namespace="${2:-default}"
    local container="${3:-}"
    
    if [ -z "$pod" ]; then
        log_error "Pod name is required"
        log_info "Usage: k8s_logs <pod> [namespace] [container]"
        return 1
    fi
    
    if [ -n "$container" ]; then
        kubectl logs -f "$pod" -c "$container" -n "$namespace"
    else
        kubectl logs -f "$pod" -n "$namespace"
    fi
}

k8s_exec() {
    local pod="$1"
    local namespace="${2:-default}"
    local container="${3:-}"
    local command="${4:-sh}"
    
    if [ -z "$pod" ]; then
        log_error "Pod name is required"
        log_info "Usage: k8s_exec <pod> [namespace] [container] [command]"
        return 1
    fi
    
    if [ -n "$container" ]; then
        kubectl exec -it "$pod" -c "$container" -n "$namespace" -- $command
    else
        kubectl exec -it "$pod" -n "$namespace" -- $command
    fi
}

# Kubernetes aliases (if not already defined)
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'
alias kns='k8s_namespace'
alias kctx='k8s_context'