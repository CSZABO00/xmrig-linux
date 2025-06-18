#!/bin/bash

set -e

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update
sudo apt upgrade -y

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Clone the XMRig repository
echo "Cloning xmrig..."
git clone https://github.com/xmrig/xmrig.git

# Create build directory and move into it
echo "Setting up build directory..."
mkdir -p xmrig/build
cd xmrig/build

# Generate build files with CMake
echo "Running cmake..."
cmake ..

# Build the project
echo "Building xmrig..."
make -j$(nproc)

echo "XMRig installation complete."
echo "run the miner using the example below"
echo "./xmrig -o xmr.ss.dxpool.com:5555 -u <USERNAME>.<WORKER> -p x -k --coin monero -a rx/0"
