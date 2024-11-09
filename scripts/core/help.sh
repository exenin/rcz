#!/bin/bash

# Define color variables
COLOR_CYAN='\033[0;36m'
COLOR_GREEN='\033[0;32m'
COLOR_RESET='\033[0m'

rcz_help() {
    local topic="${1:-}"
    
    case "$topic" in
        install)
            _rcz_help_install
            ;;
        tools)
            _rcz_help_tools
            ;;
        cloud)
            _rcz_help_cloud
            ;;
        k8s|kubernetes)
            _rcz_help_kubernetes
            ;;
        gitlab)
            _rcz_help_gitlab
            ;;
        *)
            _rcz_help_main
            ;;
    esac
}

_rcz_help_main() {
    cat << EOF
${COLOR_CYAN}RCZ Development Environment${COLOR_RESET}
A comprehensive development environment setup and management tool.

${COLOR_GREEN}Usage:${COLOR_RESET}
  rcz_help [topic]        Show help for specific topic${COLOR_RESET}
  
${COLOR_GREEN}Available Topics:${COLOR_RESET}
  install                 Installation and setup guide
    - install_tools <tool>   Install specific development tool
  tools                   Development tools and utilities
    - mkcd <dir>             Create and change to directory
    - extract <file>         Extract any archive file
    - gclone <repo>          Clone and cd into repository
  cloud                   Cloud provider tools (GCloud, AWS)
    - gcloud_auth            Authenticate with Google Cloud
    - gcloud_project         Set Google Cloud project
    - gcloud_cluster         Get cluster credentials
  kubernetes              Kubernetes commands and utilities
    - kns                    Change/view namespace
    - kctx                   Change/view context
    - k8s_pods               List pods in namespace
    - k8s_logs               View pod logs
    - k8s_exec               Execute command in pod
  gitlab                  GitLab integration tools
  secrets                 One-pass secrets management
    - gitlab_docker_login    Login to GitLab container registry
    - gitlab_helm_login      Configure Helm for GitLab registry
    - gitlab_admin_token     Get GitLab admin token

${COLOR_GREEN}Quick Reference:${COLOR_RESET}
Development:
  mkcd <dir>             Create and change to directory${COLOR_RESET}
  extract <file>         Extract any archive file${COLOR_RESET}
  gclone <repo>          Clone and cd into repository${COLOR_RESET}

Docker:
  d                      docker
  dc                     docker-compose
  dps                    docker ps
  di                     docker images
  dexec                  docker exec -it

Kubernetes:
  k                      kubectl
  kgp                    kubectl get pods
  kgs                    kubectl get services
  kgn                    kubectl get nodes
  kexec                  kubectl exec -it

For detailed help on any topic, run: rcz_help <topic>
  secrets                 One-pass secrets management
    - secrets_auth           Authenticate with secrets manager
    - secrets_create_sa      Create a service account
    - secrets_create_vault   Create a default vault

EOF
}

_rcz_help_install() {
    cat << EOF
${COLOR_CYAN}RCZ Installation Guide${COLOR_RESET}

${COLOR_GREEN}Initial Setup:${COLOR_RESET}
1. Clone the repository:
   git clone https://github.com/exenin/rcz ~/.rcz

2. Source the environment:
   source ~/.rcz/sourceme

3. Run the setup script:
   ~/.rcz/bin/setup

${COLOR_GREEN}Available Installation Commands:${COLOR_RESET}
  install_tools <tool>   Install specific development tool${COLOR_RESET}
  
${COLOR_GREEN}Supported Tools:${COLOR_RESET}
  - node/nodejs          Install Node.js via nvm
  - python/py           Install Python via pyenv
  - rust/cargo          Install Rust via rustup
  - go/golang           Install Go
  - docker              Install Docker

${COLOR_GREEN}Example Usage:${COLOR_RESET}
  install_tools node     Install Node.js
  install_tools python   Install Python
EOF
}

_rcz_help_tools() {
    cat << EOF
${COLOR_CYAN}RCZ Development Tools${COLOR_RESET}

${COLOR_GREEN}File Operations:${COLOR_RESET}
  mkcd <dir>             Create and change to directory
  extract <file>         Extract compressed archives

${COLOR_GREEN}Git Operations:${COLOR_RESET}
  g                      git
  ga                     git add
  gc                     git commit
  gp                     git push
  gl                     git pull
  gst                    git status
  gd                     git diff
  gco                    git checkout

${COLOR_GREEN}Docker Operations:${COLOR_RESET}
  d                      docker
  dc                     docker-compose
  dps                    docker ps
  di                     docker images
  dexec                  docker exec -it

${COLOR_GREEN}Installation:${COLOR_RESET}
  install_tools          Install development tools
EOF
}

_rcz_help_cloud() {
    cat << EOF
${COLOR_CYAN}RCZ Cloud Tools${COLOR_RESET}

${COLOR_GREEN}Google Cloud Commands:${COLOR_RESET}
  gcl                    gcloud shortcut
  gcp                    gcloud config set project
  gca                    gcloud auth login
  gcr                    gcloud container clusters get-credentials

${COLOR_GREEN}Functions:${COLOR_RESET}
  gcloud_auth            Authenticate with Google Cloud
  gcloud_project         Set Google Cloud project
  gcloud_cluster         Get cluster credentials

${COLOR_GREEN}Example Usage:${COLOR_RESET}
  gcloud_auth user@example.com
  gcloud_project my-project
  gcloud_cluster my-cluster us-central1-a
EOF
}

_rcz_help_kubernetes() {
    cat << EOF
${COLOR_CYAN}RCZ Kubernetes Tools${COLOR_RESET}

${COLOR_GREEN}Basic Commands:${COLOR_RESET}
  k                      kubectl shortcut
  kgp                    kubectl get pods
  kgs                    kubectl get services
  kgn                    kubectl get nodes
  kd                     kubectl describe
  kl                     kubectl logs
  ke                     kubectl exec -it

${COLOR_GREEN}Context/Namespace:${COLOR_RESET}
  kns                    Change/view namespace
  kctx                   Change/view context

${COLOR_GREEN}Functions:${COLOR_RESET}
  k8s_context            Manage Kubernetes contexts
  k8s_namespace          Manage Kubernetes namespaces
  k8s_pods               List pods in namespace
  k8s_logs               View pod logs
  k8s_exec               Execute command in pod

${COLOR_GREEN}Example Usage:${COLOR_RESET}
  kns kube-system        Switch to kube-system namespace
  k8s_logs my-pod        View logs for my-pod
  k8s_exec my-pod bash   Open shell in my-pod
EOF
}

_rcz_help_gitlab() {
    cat << EOF
${COLOR_CYAN}RCZ GitLab Tools${COLOR_RESET}

${COLOR_GREEN}Available Commands:${COLOR_RESET}
  gitlab_docker_login    Login to GitLab container registry
  gitlab_helm_login      Configure Helm for GitLab registry
  gitlab_admin_token     Get GitLab admin token

${COLOR_GREEN}Usage Examples:${COLOR_RESET}
1. Docker Registry Login:
   gitlab_docker_login [registry] [username] [token]

2. Helm Registry Setup:
   gitlab_helm_login [registry] [username] [token]

3. Get Admin Token:
   gitlab_admin_token <gitlab_url> <admin_user> <admin_password>

${COLOR_GREEN}Environment Variables:${COLOR_RESET}
  GITLAB_USER            Default GitLab username
  GITLAB_TOKEN           Default GitLab token
  GITLAB_URL             Default GitLab URL
EOF
}

# Fix the export syntax
if [ -n "$BASH_VERSION" ]; then
    export -f rcz_help
    export -f _rcz_help_main
    export -f _rcz_help_install
    export -f _rcz_help_tools
    export -f _rcz_help_cloud
    export -f _rcz_help_kubernetes
    export -f _rcz_help_gitlab
fi

_rcz_help_secrets() {
    cat << EOF
${COLOR_CYAN}RCZ Secrets Management${COLOR_RESET}

${COLOR_GREEN}Available Commands:${COLOR_RESET}
  secrets_auth           Authenticate with secrets manager
  secrets_create_sa      Create a service account
  secrets_create_vault   Create a default vault

${COLOR_GREEN}Usage Examples:${COLOR_RESET}
1. Authenticate with Secrets Manager:
   secrets_auth

2. Create a Service Account:
   secrets_create_sa <service_account_name>

3. Create a Default Vault:
   secrets_create_vault <vault_name>

EOF
}

if [ -n "$BASH_VERSION" ]; then
    export -f rcz_help
    export -f _rcz_help_main
    export -f _rcz_help_install
    export -f _rcz_help_tools
    export -f _rcz_help_cloud
    export -f _rcz_help_kubernetes
    export -f _rcz_help_gitlab
    export -f _rcz_help_secrets
