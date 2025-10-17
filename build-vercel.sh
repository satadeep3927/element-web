#!/bin/bash
set -e

echo "🚀 Starting StreamMint build for Vercel..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf lib webapp

# Create webapp directory
mkdir -p webapp

# Build resources and module system
echo "📦 Building resources..."
yarn build:res
yarn build:module_system

# Set Node.js memory limit for webpack build
echo "⚡ Building application bundle..."
export NODE_OPTIONS="--max-old-space-size=4096"

# Try webpack build with more memory
npx webpack --progress --mode production || {
    echo "❌ Webpack build failed, trying alternative approach..."
    exit 1
}

echo "✅ StreamMint build completed successfully!"