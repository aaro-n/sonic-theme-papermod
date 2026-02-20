#!/bin/bash
# AI Initialization Compliance Check for Sonic PaperMod Theme
# Verifies that the .ai/ knowledge base system is properly initialized

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════╗${NC}"
echo -e "${BLUE}║  AI Knowledge Base Compliance Check  ║${NC}"
echo -e "${BLUE}╚══════════════════╝${NC}"
echo ""

# Check if .ai/ folder exists
if [ ! -d ".ai" ]; then
    echo -e "${RED}❌ ERROR: .ai/ folder not found!${NC}"
    echo ""
    echo "This project requires the .ai/ knowledge base folder."
    echo "It should contain:"
    echo "  - .ai/.INIT_REQUIRED"
    echo "  - .ai/MUST_READ_FIRST.md"
    echo "  - .ai/PROJECT_OVERVIEW.md"
    echo "  - .ai/IMPORTANT_NOTES.md"
    echo "  - .ai/ISSUES_AND_SOLUTIONS.md"
    echo ""
    echo "To initialize, run:"
    echo "  mkdir -p .ai"
    echo "  touch .ai/.INIT_REQUIRED"
    exit 1
fi

echo "✓ .ai/ folder found"
echo ""

# Check critical files
echo "📋 Checking required .ai/ files..."

FILES=(
    ".ai/.INIT_REQUIRED"
    ".ai/MUST_READ_FIRST.md"
    ".ai/PROJECT_OVERVIEW.md"
    ".ai/IMPORTANT_NOTES.md"
    ".ai/ISSUES_AND_SOLUTIONS.md"
)

MISSING_FILES=()

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (MISSING)"
        MISSING_FILES+=("$file")
    fi
done

echo ""

if [ ${#MISSING_FILES[@]} -gt 0 ]; then
    echo -e "${RED}❌ ERROR: Missing critical files:${NC}"
    for file in "${MISSING_FILES[@]}"; do
        echo "  - $file"
    done
    exit 1
fi

# Verify all files are not empty
echo "🔍 Verifying file contents..."

EMPTY_FILES=()

for file in "${FILES[@]}"; do
    if [ -s "$file" ]; then
        SIZE=$(wc -c < "$file")
        SIZE_KB=$((SIZE / 1024))
      echo -e "  ${GREEN}✓${NC} $file ($SIZE bytes)"
    else
      echo -e "  ${YELLOW}⚠️${NC} $file (EMPTY)"
     EMPTY_FILES+=("$file")
    fi
done

if [ ${#EMPTY_FILES[@]} -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  WARNING: Some files are empty:${NC}"
    for file in "${EMPTY_FILES[@]}"; do
        echo "  - $file"
    done
    echo ""
    echo "Consider adding content to document the project's knowledge."
fi

echo ""
echo -e "${BLUE}══════════════════════${NC}"
echo -e "${GREEN}✅ AI Knowledge Base Check Passed!${NC}"
echo ""

echo "📖 Documentation structure:"
echo "  1. .ai/.INIT_REQUIRED - Initialization marker"
echo "  2. .ai/MUST_READ_FIRST.md - Rules and quick reference"
echo "  3. .ai/PROJECT_OVERVIEW.md - Project structure"
echo "  4. .ai/IMPORTANT_NOTES.md - Key code locations and common tasks"
echo "  5. .ai/ISSUES_AND_SOLUTIONS.md - Problems and solutions"
echo ""

echo "🎯 For AI Assistants - Read these files in order:"
echo "  1. MUST_READ_FIRST.md (rules and conventions)"
echo "  2. PROJECT_OVERVIEW.md (project architecture)"
echo "  3. IMPORTANT_NOTES.md (critical locations)"
echo "  4. ISSUES_AND_SOLUTIONS.md (past issues)"
echo ""

echo "💡 Tips:"
echo "  • Keep .ai/ files updated with every code change"
echo "  • Record problems, solutions, and lessons learned"
echo "  • Use tags: ✅ (success), ❌ (failure), ⚠️ (warning), 📋 (info)"
echo ""

echo -e "${BLUE}═════════════════════${NC}"

exit 0
