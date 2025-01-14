#!/bin/bash -e

PROJECT="$(basename "$(pwd)")"

echo "Detect changes in projects"
if git diff --name-only HEAD^...HEAD | grep "^projects/${PROJECT}"; then
  echo "Changes here, run the build"
  make oci
  if [ "${CIRCLE_BRANCH}" == "master" ]; then
    echo "Publish images for master branch ..."
    make push
  else
    echo "Skip publishing for working branches other than master."
    echo "Build images for branches are available in the CircleCI build artifacts."
  fi
else
  echo "No changes detected"
  exit 0
fi