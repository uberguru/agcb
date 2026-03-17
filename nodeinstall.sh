k#!/bin/bash

# 1. Define the NVM directory clearly
export NVM_DIR="$HOME/.nvm"

# 2. Create the directory if it's missing (to satisfy the error you saw)
if [ ! -d "$NVM_DIR" ]; then
    echo "Creating the NVM directory at $NVM_DIR..."
    mkdir -p "$NVM_DIR"
fi

echo "Cloning NVM into the void (properly this time)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# 3. CRITICAL: Manually load NVM into THIS script's memory
# This is where the previous attempt failed.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# 4. Verify NVM is actually loaded before proceeding
if ! command -v nvm &> /dev/null; then
    echo "Error: NVM still isn't in the path. Gravity is winning."
    exit 1
fi

echo "Installing Node.js 24 (Krypton LTS)..."
nvm install 24

echo "Setting v24 as default..."
nvm use 24
nvm alias default 24

echo "--- Verification ---"
echo "Node version: $(node -v)"
echo "NPM version:  $(npm -v)"
echo "--------------------"

echo "There. Now you are *actually* running on Node.js. No more pretend success."


nvm install 24
nvm use 24
