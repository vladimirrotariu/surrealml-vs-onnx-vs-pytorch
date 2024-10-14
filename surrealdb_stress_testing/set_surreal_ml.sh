#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <root_password>"
    exit 1
fi

USER="$1"
ROOT_PASSWORD="$2"

export RUST_BACKTRACE=full

curl -sSf https://install.surrealdb.com | sh
curl https://sh.rustup.rs -sSf | sh -s -- -y
source /home/"$USER"/.cargo/env

echo "$ROOT_PASSWORD" | sudo -S surreal start
