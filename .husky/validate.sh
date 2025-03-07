#!/bin/sh

# Read the commit message from the file provided by Git
commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Define the allowed commit types
allowed_types="fix|feat|chore|build|docs|ops|refactor|test|perf|style"

# Check if the commit message matches the required format
if ! echo "$commit_msg" | grep -Eq "^($allowed_types): .+"; then
  echo ""
  echo "❌ Commit message does not follow the required format!"
  echo "Format: <type>: <description>"
  echo "Allowed types: $allowed_types"
  echo ""
  echo "Example 1: 'fix: resolve authentication error'"
  echo "Example 2: 'test: authentication test'"
  echo ""
  exit 1
fi

exit 0
