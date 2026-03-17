#!/bin/bash

# A script to introduce Google Cloud CLI to your Debian system.
# Use with caution and perhaps a spot of tea.

set -e

echo "Updating system packages..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

# Check if the key already exists to avoid clutter
if [ ! -f /usr/share/keyrings/cloud.google.gpg ]; then
    echo "Importing the Google Cloud public key..."
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
fi

echo "Adding the gcloud CLI distribution URI..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

echo "Final update and installation..."
sudo apt-get update && sudo apt-get install -y google-cloud-cli

echo "Installation complete. Shall we see if it actually works?"
gcloud --version
