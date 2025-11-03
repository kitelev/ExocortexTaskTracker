#!/bin/bash
# Test runner script with best practices

set -e  # Exit on error
set -o pipefail  # Catch errors in pipes

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🧹 Cleaning build...${NC}"
swift package clean
rm -rf .build

echo -e "${BLUE}🔨 Building...${NC}"
swift build

echo -e "${BLUE}🧪 Running tests...${NC}"
swift run ExocortexTaskTrackerTests

echo -e "\n${GREEN}✅ All tests passed!${NC}"
