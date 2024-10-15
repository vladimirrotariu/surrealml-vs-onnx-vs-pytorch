#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

PORT="$1"

export RUST_BACKTRACE=full

curl -sSf https://install.surrealdb.com | sh
curl https://sh.rustup.rs -sSf | sh -s -- -y
source /home/"$USER"/.cargo/env

surreal start --unauthenticated --bind 127.0.0.1:$PORT