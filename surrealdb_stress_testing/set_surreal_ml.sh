#!/bin/bash

USER="vld28"

curl -sSf https://install.surrealdb.com | sh
curl https://sh.rustup.rs -sSf | sh -s -- -y
source /home/"$USER"/.cargo/env


