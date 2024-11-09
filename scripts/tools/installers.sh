#!/bin/bash

# Node.js installation
install_node() {
    local version="${1:-lts}"
    
    if ! command -v nvm &>/dev/null; then
        log_info "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
        
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi
    
    log_info "Installing Node.js ${version}..."
    nvm install "$version"
    nvm use "$version"
    
    # Configure npm
    mkdir -p "${HOME}/.npm-global"
    npm config set prefix "${HOME}/.npm-global"
}

# Python installation
install_python() {
    local version="${1:-3}"
    
    if ! command -v pyenv &>/dev/null; then
        log_info "Installing pyenv..."
        curl https://pyenv.run | bash
        
        export PATH="${HOME}/.pyenv/bin:$PATH"
        eval "$(pyenv init -)"
    fi
    
    log_info "Installing Python ${version}..."
    pyenv install "$version"
    pyenv global "$version"
    
    # Install pip packages
    pip install --upgrade pip
    pip install virtualenv pipenv poetry
}

# Rust installation
install_rust() {
    if ! command -v rustup &>/dev/null; then
        log_info "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "${HOME}/.cargo/env"
    fi
    
    rustup update
    rustup component add clippy rustfmt
}

# Go installation
install_go() {
    local version="${1:-latest}"
    
    if ! command -v go &>/dev/null; then
        log_info "Installing Go ${version}..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install go
        elif command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y golang
        elif command -v yum &>/dev/null; then
            sudo yum install -y golang
        fi
    fi
    
    # Setup Go environment
    mkdir -p "${HOME}/go/{bin,src,pkg}"
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:${PATH}"
}

# Docker installation
install_docker() {
    if ! command -v docker &>/dev/null; then
        log_info "Installing Docker..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            brew install --cask docker
        else
            curl -fsSL https://get.docker.com | sh
            sudo usermod -aG docker "$USER"
        fi
    fi
}

# Main installer function
install_tools() {
    local tool="$1"
    shift
    
    case "$tool" in
        node|nodejs)  install_node "$@" ;;
        python|py)    install_python "$@" ;;
        rust|cargo)   install_rust "$@" ;;
        go|golang)    install_go "$@" ;;
        docker)       install_docker "$@" ;;
        *)           log_error "Unknown tool: $tool" ;;
    esac
}

# Export functions individually
if [ -n "$BASH_VERSION" ]; then
    export -f install_tools
    export -f install_node
    export -f install_python
    export -f install_rust
    export -f install_go
    export -f install_docker
fi
