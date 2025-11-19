#!/bin/bash

# Script to generate iOS app icons from a single source image
# Usage: ./generate_icons.sh

echo "🎨 Generating iOS App Icons..."

SOURCE_IMAGE="assets/app_icon.png"
OUTPUT_DIR="ios/Runner/Assets.xcassets/AppIcon.appiconset"

# Check if source image exists
if [ ! -f "$SOURCE_IMAGE" ]; then
    echo "❌ Error: Source image not found at $SOURCE_IMAGE"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "📦 Installing ImageMagick..."
    sudo apt-get update -qq
    sudo apt-get install -y imagemagick
fi

# Generate icons for different sizes
echo "📱 Generating iPhone icons..."
convert "$SOURCE_IMAGE" -resize 40x40 "$OUTPUT_DIR/Icon-App-20x20@2x.png"
convert "$SOURCE_IMAGE" -resize 60x60 "$OUTPUT_DIR/Icon-App-20x20@3x.png"
convert "$SOURCE_IMAGE" -resize 58x58 "$OUTPUT_DIR/Icon-App-29x29@2x.png"
convert "$SOURCE_IMAGE" -resize 87x87 "$OUTPUT_DIR/Icon-App-29x29@3x.png"
convert "$SOURCE_IMAGE" -resize 80x80 "$OUTPUT_DIR/Icon-App-40x40@2x.png"
convert "$SOURCE_IMAGE" -resize 120x120 "$OUTPUT_DIR/Icon-App-40x40@3x.png"
convert "$SOURCE_IMAGE" -resize 120x120 "$OUTPUT_DIR/Icon-App-60x60@2x.png"
convert "$SOURCE_IMAGE" -resize 180x180 "$OUTPUT_DIR/Icon-App-60x60@3x.png"

echo "📱 Generating iPad icons..."
convert "$SOURCE_IMAGE" -resize 20x20 "$OUTPUT_DIR/Icon-App-20x20@1x.png"
convert "$SOURCE_IMAGE" -resize 29x29 "$OUTPUT_DIR/Icon-App-29x29@1x.png"
convert "$SOURCE_IMAGE" -resize 40x40 "$OUTPUT_DIR/Icon-App-40x40@1x.png"
convert "$SOURCE_IMAGE" -resize 76x76 "$OUTPUT_DIR/Icon-App-76x76@1x.png"
convert "$SOURCE_IMAGE" -resize 152x152 "$OUTPUT_DIR/Icon-App-76x76@2x.png"
convert "$SOURCE_IMAGE" -resize 167x167 "$OUTPUT_DIR/Icon-App-83.5x83.5@2x.png"

echo "🖼️ Generating App Store icon..."
convert "$SOURCE_IMAGE" -resize 1024x1024 "$OUTPUT_DIR/Icon-App-1024x1024@1x.png"

echo "✅ All icons generated successfully!"
echo "📁 Icons saved to: $OUTPUT_DIR"
echo ""
echo "Next steps:"
echo "1. Open Xcode: open ios/Runner.xcworkspace"
echo "2. Check Assets.xcassets/AppIcon to verify icons"
echo "3. Build and run: flutter build ios --release"
