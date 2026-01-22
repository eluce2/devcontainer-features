#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'agent-browser' Feature with no options.
#
# NOTE: This feature requires Node.js to be installed. The auto-generated test
# may fail without Node.js. Use scenario tests (with_node.sh) for proper testing.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "agent-browser is installed" command -v agent-browser
check "agent-browser version" agent-browser --version

# Report results
reportResults
