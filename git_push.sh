#!/bin/bash
# Simple helper to add, commit, and push with a comment prompt

# Exit immediately if a command fails
set -e

# Make sure we're in a git repo
if [ ! -d ".git" ]; then
  echo "❌ This is not a Git repository."
  exit 1
fi

# Show current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "📦 Current branch: $current_branch"

# Add all changes
git add .

# Ask for commit message
read -p "📝 Enter commit message: " commit_message

# If user didn't type anything, stop
if [ -z "$commit_message" ]; then
  echo "❌ Commit message cannot be empty."
  exit 1
fi

# Commit and push
git commit -m "$commit_message"
git push origin "$current_branch"

echo "✅ Changes committed and pushed to $current_branch."

