#!/bin/bash
set -e

# shellcheck disable=SC1091
. ./release.env

GIT_MESSAGE="$RELEASE_DESCRIPTION"

set -x
git commit -m "$GIT_MESSAGE"
git push
