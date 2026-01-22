#!/bin/bash

# Test agent-browser feature with Node.js feature installed

set -e

source dev-container-features-test-lib

# Verify Node.js is available
check "node is installed" command -v node
check "npm is installed" command -v npm

# Verify agent-browser is installed
check "agent-browser is installed" command -v agent-browser
check "agent-browser version" agent-browser --version

# Verify Chromium was installed
check "chromium installed" test -d "$HOME/.cache/puppeteer" -o -d "$HOME/.cache/chromium" -o -d "/root/.cache/puppeteer"

# Report results
reportResults
