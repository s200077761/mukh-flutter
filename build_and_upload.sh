#!/bin/bash

# Automated build and upload script for Mukh Flutter App
# This script automates the iOS build process

set -e  # Exit on error

echo "🚀 Mukh Flutter - Automated Build Script"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ️  $1${NC}"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

print_success "Flutter found: $(flutter --version | head -1)"
echo ""

# Step 1: Clean the project
print_info "Step 1: Cleaning project..."
flutter clean
print_success "Project cleaned"
echo ""

# Step 2: Get dependencies
print_info "Step 2: Getting dependencies..."
flutter pub get
print_success "Dependencies installed"
echo ""

# Step 3: Run tests (optional)
print_info "Step 3: Running tests..."
flutter test || print_info "No tests found or tests failed (continuing anyway)"
echo ""

# Step 4: Build iOS release
print_info "Step 4: Building iOS release..."
flutter build ios --release
print_success "iOS build completed"
echo ""

# Step 5: Instructions for Xcode
echo "=========================================="
print_success "Build completed successfully!"
echo ""
print_info "Next steps to upload to App Store:"
echo ""
echo "1. Open Xcode workspace:"
echo "   open ios/Runner.xcworkspace"
echo ""
echo "2. In Xcode:"
echo "   - Select 'Any iOS Device (arm64)' from the device menu"
echo "   - Go to Product → Archive"
echo "   - Wait for the archive to complete"
echo ""
echo "3. In Organizer (opens automatically):"
echo "   - Select the latest archive"
echo "   - Click 'Distribute App'"
echo "   - Choose 'App Store Connect'"
echo "   - Choose 'Upload'"
echo "   - Follow the prompts"
echo ""
echo "4. Go to App Store Connect:"
echo "   https://appstoreconnect.apple.com"
echo "   - Wait for the build to process (10-30 minutes)"
echo "   - Fill in app information"
echo "   - Submit for review"
echo ""
print_success "Good luck! 🍀"
