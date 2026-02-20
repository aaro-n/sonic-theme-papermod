#!/bin/bash
# Git Hooks Installation Script for Sonic PaperMod Theme
# Installs a pre-commit hook to enforce .ai/ knowledge base updates

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}═══════════════════${NC}"
echo -e "${BLUE}  Git Hooks Installation Script${NC}"
echo -e "${BLUE}════════════════════════${NC}"
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ ERROR: Not a git repository!${NC}"
    echo "Please run this script from the project root directory."
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

echo "📁 Creating .git/hooks directory..."

# Create the pre-commit hook
echo "⚙️  Installing pre-commit hook..."

cat > .git/hooks/pre-commit << 'HOOK_EOF'
#!/bin/bash
# Pre-commit hook: Enforce .ai/ knowledge base updates for Sonic PaperMod Theme

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Get staged files
STAGED_FILES=$(git diff --cached --name-only)

# Separate code files from .ai files
CODE_FILES=$(echo "$STAGED_FILES" | grep -E '\.(tmpl|css|yaml|yml|json|html)$' || true)
AI_FILES=$(echo "$STAGED_FILES" | grep '^\.ai/' || true)

# If code is modified but .ai/ is not, warn user
if [ -n "$CODE_FILES" ] && [ -z "$AI_FILES" ]; then
    echo -e "${RED}⚠️  WARNING: Code modified but .ai/ knowledge base not updated!${NC}"
    echo ""
    echo "Code files being committed:"
    echo "$CODE_FILES" | sed 's/^/  ✗ /'
    echo ""
    echo "Missing .ai/ updates! According to project rules:"
    echo "  • Update .ai/ISSUES_AND_SOLUTIONS.md (record what was fixed/changed)"
    echo "  • Update .ai/IMPORTANT_NOTES.md (if you discovered important information)"
    echo "  • Stage changes: git add .ai/"
    echo ""
    echo -e "${YELLOW}Proceed without .ai/ updates? (y/N)${NC}"
    read -r response
    
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo -e "${RED}Commit cancelled. Please update .ai/ files first.${NC}"
        exit 1
    fi
fi

# Prevent deletion of critical .ai/ files
if git diff --cached --diff-filter=D --name-only | grep -q '\.ai/.INIT_REQUIRED'; then
    echo -e "${RED}❌ ERROR: Cannot delete .ai/.INIT_REQUIRED!${NC}"
    echo "This file marks the project's AI knowledge base system initialization."
  exit 1
fi

if git diff --cached --diff-filter=D --name-only | grep -q '\.ai/MUST_READ_FIRST.md'; then
    echo -e "${RED}❌ ERROR: Cannot delete .ai/MUST_READ_FIRST.md!${NC}"
    echo "This file documents critical rules and conventions."
    exit 1
fi

if git diff --cached --diff-filter=D --name-only | grep -q '\.ai/PROJECT_OVERVIEW.md'; then
    echo -e "${RED}❌ ERROR: Cannot delete .ai/PROJECT_OVERVIEW.md!${NC}"
    echo "This file contains essential project structure information."
    exit 1
fi

echo -e "${GREEN}✓ Pre-commit check passed${NC}"
exit 0
HOOK_EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

echo -e "${GREEN}✅ Pre-commit hook installed successfully!${NC}"
echo ""

echo "🔍 Verifying hook installation..."
if [ -x ".git/hooks/pre-commit" ]; then
    echo -e "${GREEN}✓ Hook is executable${NC}"
else
    echo -e "${RED}✗ Hook is not executable!${NC}"
    chmod +x .git/hooks/pre-commit
    echo -e "${GREEN}✓ Fixed permissions${NC}"
fi

echo ""
echo -e "${BLUE}════════════════════════${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "${BLUE}═══════════════════════${NC}"
echo ""
echo "📋 What the hook does:"
echo "  • Warns when you commit code changes without updating .ai/"
echo "  • Prevents accidental deletion of critical .ai/ files"
echo "  • Ensures knowledge base stays in sync with code"
echo ""
echo "🎯 How to use:"
echo "  1. Make your code changes"
echo "  2. Update .ai/ISSUES_AND_SOLUTIONS.md"
echo "  3. git add .ai/"
echo "  4. git commit"
echo ""
echo "⏭️  To skip the hook (emergency only):"
echo "  git commit --no-verify"
echo ""
echo "🗑️  To uninstall the hook:"
echo "  rm .git/hooks/pre-commit"
echo ""
echo "For more details, read: .ai/IMPORTANT_NOTES.md"
echo ""
