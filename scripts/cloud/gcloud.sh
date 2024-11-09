#!/bin/bash

# GCloud helper functions
gcloud_auth() {
    local account="$1"
    gcloud auth login "$account"
}

gcloud_project() {
    local project="$1"
    gcloud config set project "$project"
}

gcloud_cluster() {
    local cluster="$1"
    local zone="${2:-us-central1-a}"
    local project="${3:-$(gcloud config get-value project)}"
    
    gcloud container clusters get-credentials "$cluster" --zone "$zone" --project "$project"
}

# GCloud aliases
alias gcl='gcloud'
alias gcp='gcloud config set project'
alias gca='gcloud auth login'
alias gcr='gcloud container clusters get-credentials'