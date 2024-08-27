#!/bin/bash

set -e
set -o pipefail
set -o nounset

SOURCE_DIRECTORY=${GITHUB_WORKSPACE}/

# Set environment variables required by supported plugins
export JEKYLL_ENV="production"


# Run the command, capturing the output
build_output="$(bundle exec jekyll build -p /opt/jekyll/plugins)"

# Capture the exit code
exit_code=$?

if [ $exit_code -ne 0 ]; then
  # Remove the newlines from the build_output as annotation not support multiline
  error=$(echo "$build_output" | tr '\n' ' ' | tr -s ' ')
  echo "::error::$error"
else
  # Display the build_output directly
  echo "$build_output"
fi

# Exit with the captured exit code
exit $exit_code
