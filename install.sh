#!/usr/bin/env sh

. ./project.sh

echo "installing composer dependencies..."
if ! xcompose "run --rm --no-deps web sh -c 'cd /app && composer --ansi install'"; then
  echo "installing composer dependencies failed"
  exit 1
fi

echo "done"
