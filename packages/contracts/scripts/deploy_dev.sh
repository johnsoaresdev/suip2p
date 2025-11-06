#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."
echo "Building package..."
sui move build
echo "Publishing to devnet (ensure your Sui CLI is configured)"
sui client publish --gas-budget 50000000
