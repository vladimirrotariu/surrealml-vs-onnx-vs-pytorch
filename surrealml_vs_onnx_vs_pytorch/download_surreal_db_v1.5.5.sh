#!/bin/bash

VERSION="1.5.5"
DOWNLOAD_DIR="/tmp"
[ ! -d "$DOWNLOAD_DIR" ] && DOWNLOAD_DIR="."

ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "arm64" ]] || [[ "$ARCH" == "aarch64" ]]; then
    ARCH="arm64"
else
    echo "Error: Unsupported CPU architecture ($ARCH). Exiting."
    exit 1
fi

FILENAME="surreal-v${VERSION}.linux-${ARCH}.tgz"
DOWNLOAD_URL="https://github.com/surrealdb/surrealdb/releases/download/v${VERSION}/${FILENAME}"

echo "Downloading SurrealDB v${VERSION} for ${ARCH}..."
if ! curl -Lo "${DOWNLOAD_DIR}/${FILENAME}" "${DOWNLOAD_URL}"; then
    echo "Error: Failed to download SurrealDB from ${DOWNLOAD_URL}. Exiting."
    exit 1
fi

echo "Extracting ${FILENAME}..."
if ! tar -xzf "${DOWNLOAD_DIR}/${FILENAME}" -C "${DOWNLOAD_DIR}"; then
    echo "Error: Failed to extract ${FILENAME}. Exiting."
    rm -f "${DOWNLOAD_DIR}/${FILENAME}"
    exit 1
fi

echo "Please enter your password to move the SurrealDB binary to /usr/local/bin..."
if ! sudo mv "${DOWNLOAD_DIR}/surreal" /usr/local/bin/; then
    echo "Error: Failed to move the SurrealDB binary. Exiting."
    rm -f "${DOWNLOAD_DIR}/${FILENAME}" "${DOWNLOAD_DIR}/surreal"
    exit 1
fi

rm -f "${DOWNLOAD_DIR}/${FILENAME}"

echo "SurrealDB v${VERSION} installed successfully."
