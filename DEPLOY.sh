#!/bin/bash
# Deploy dashboard to GitHub
# Run this from your Mac terminal (not from Claude)

set -e  # exit on error

REPO_URL="https://github.com/Apenaloza1/yt-shorts-analysis.git"
DASHBOARD_DIR="$HOME/Documents/Youtube Ads/dashboard"

echo "=== Deploying YouTube Shorts Analysis Dashboard ==="
echo ""

cd "$DASHBOARD_DIR"
echo "✓ In dashboard folder: $(pwd)"
echo ""

# Clean any partial git state
if [ -d ".git" ]; then
  echo "Removing previous .git folder (Claude sandbox left some artifacts)..."
  sudo rm -rf .git
  echo "✓ Cleaned"
  echo ""
fi

# Initialize git
echo "Initializing git..."
git init -q
git config user.name "Apenaloza1"
git config user.email "apenaloza@trafilea.com"
echo "✓ Git initialized"
echo ""

# Stage all files
echo "Staging all files (this may take a few seconds for the videos)..."
git add .
echo "✓ Staged $(git status --short | wc -l | tr -d ' ') files"
echo ""

# Commit
echo "Committing..."
git commit -q -m "Initial dashboard - YouTube Shorts Competitive Analysis"
echo "✓ Commit created"
echo ""

# Set main branch
git branch -M main

# Add remote
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"
echo "✓ Remote configured"
echo ""

# Push (this will prompt for GitHub credentials if not cached)
echo "Pushing to GitHub..."
echo "(If prompted: enter your GitHub username + a Personal Access Token as password)"
echo "(Generate token at: https://github.com/settings/tokens)"
echo ""
git push -u origin main

echo ""
echo "🎉 Push complete!"
echo ""
echo "Now enable GitHub Pages:"
echo "1. Open: https://github.com/Apenaloza1/yt-shorts-analysis/settings/pages"
echo "2. Source: 'Deploy from a branch'"
echo "3. Branch: 'main' / Folder: '/ (root)'"
echo "4. Click Save"
echo "5. Wait 1-2 min, then access: https://apenaloza1.github.io/yt-shorts-analysis/"
