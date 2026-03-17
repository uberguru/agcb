#!/bin/bash

# A touch of authority: checking for root
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run with sudo. Chrome requires a proper permit."
  exit 1
fi

echo "Preparing the landing strip for Google Chrome..."

# 1. Update the local package index
apt update

# 2. Download the latest stable 64-bit Debian package
echo "Fetching the latest .deb from Google's servers..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb

# 3. Attempt the installation
echo "Installing the package..."
dpkg -i /tmp/google-chrome.deb

# 4. The 'Safety Net'
# If dpkg failed due to missing libraries, this command forces APT to find and install them.
apt install -f -y

# 5. Clean up the mess
rm /tmp/google-chrome.deb

echo "--- Installation Complete ---"
echo "You can now launch it by typing 'google-chrome' or finding it in your Applications menu."
