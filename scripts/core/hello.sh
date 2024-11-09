#!/bin/bash

hello() {
    echo "Hello, World!"
}

if [ -n "$BASH_VERSION" ]; then
    export -f hello
fi
