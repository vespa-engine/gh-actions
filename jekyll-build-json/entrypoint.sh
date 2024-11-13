#!/bin/bash

if [[ "${RUNNER_DEBUG:-}" == "1" ]]; then
  set -x
fi

set -e
set -o pipefail
set -o nounset

SOURCE_DIRECTORY="${GITHUB_WORKSPACE}/${INPUT_SOURCE}"
DESTINATION_DIRECTORY="${GITHUB_WORKSPACE}/${INPUT_DESTINATION}"
JEKYLL_CONFIG_FILE="${GITHUB_WORKSPACE}/${INPUT_CONFIG}"
JEKYLL_ARGS=("-p" "/opt/jekyll/plugins")

# Set environment variables required by supported plugins
export JEKYLL_ENV="production"
export JEKYLL_GITHUB_TOKEN="${INPUT_TOKEN}"
export JEKYLL_BUILD_REVISION="${GITHUB_SHA}"
export JEKYLL_LOG_LEVEL="${INPUT_LOG_LEVEL:-info}"

if [[ "${JEKYLL_LOG_LEVEL}" = "verbose" || "${JEKYLL_LOG_LEVEL}" = "debug" ]]; then
  JEKYLL_ARGS+=("-V")
fi

if [[ "${RUNNER_DEBUG:-}" == "1" ]]; then
  gem env
  bundle env

  echo "SOURCE_DIRECTORY: ${SOURCE_DIRECTORY}"
  echo "DESTINATION_DIRECTORY: ${DESTINATION_DIRECTORY}"
  echo "JEKYLL_CONFIG_FILE: ${JEKYLL_CONFIG_FILE}"
  echo "GITHUB_WORKSPACE: ${GITHUB_WORKSPACE}"

  echo "====== START Config file ====="
  cat "${JEKYLL_CONFIG_FILE}"
  echo "====== END Config file ====="
fi

{ cd "${BUNDLE_APP_CONFIG}" || { echo "::error::pages gem not found"; exit 1; }; }

# Run the command, capturing the output
build_output="$(bundle exec jekyll build ${JEKYLL_ARGS[@]} --config "${JEKYLL_CONFIG_FILE}" --source "${SOURCE_DIRECTORY}" --destination "${DESTINATION_DIRECTORY}")"

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
