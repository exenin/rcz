#!/bin/bash

# Development tool configurations
setup_dev_tools() {
    # Install common development tools
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install git vim curl wget tmux
    elif command -v apt-get >/dev/null; then
        sudo apt-get update
        sudo apt-get install -y git vim curl wget tmux
    elif command -v yum >/dev/null; then
        sudo yum install -y git vim curl wget tmux
    fi
}

# Development environment setup
setup_dev_env() {
    setup_dev_tools
    setup_git_config
    setup_vim_config
} 