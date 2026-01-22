#!/bin/sh
set -e

echo "Activating feature 'agent-browser'"

VERSION=${VERSION:-latest}
echo "Installing agent-browser version: $VERSION"

# Check if Node.js is available
if ! command -v node > /dev/null 2>&1; then
    echo "Node.js is required but not found. Please add the Node.js feature to your devcontainer."
    exit 1
fi

# Install Chromium dependencies (Debian/Ubuntu)
if command -v apt-get > /dev/null 2>&1; then
    echo "Installing Chromium dependencies..."
    apt-get update
    apt-get install -y --no-install-recommends \
        libnss3 \
        libatk1.0-0 \
        libatk-bridge2.0-0 \
        libcups2 \
        libdrm2 \
        libxkbcommon0 \
        libxcomposite1 \
        libxdamage1 \
        libxfixes3 \
        libxrandr2 \
        libgbm1 \
        libpango-1.0-0 \
        libcairo2 \
        libasound2 \
        libxshmfence1 \
        fonts-liberation \
        libappindicator3-1 2>/dev/null || true
    rm -rf /var/lib/apt/lists/*
fi

# Install agent-browser globally
echo "Installing agent-browser..."
if [ "$VERSION" = "latest" ]; then
    npm install -g agent-browser
else
    npm install -g "agent-browser@${VERSION}"
fi

# Download Chromium
echo "Installing Chromium via agent-browser..."
agent-browser install --with-deps

echo "agent-browser installation complete!"
