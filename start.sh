#!/usr/bin/env sh

. ./project.sh

if ! [ -d "$PROJECT_PATH/web/.git" ]; then
  # install demo PHP sources
  echo "cloning php sources..."
  cd ${PROJECT_PATH}
  if ! git clone https://github.com/mazelab/php-slim-example web; then
    echo "git clone failed"
    exit 1
  fi
fi

if ! [ -d "$PROJECT_PATH/web/vendor" ]; then
  echo "installing composer dependencies..."
  if ! xcompose "run --rm --no-deps web sh -c 'cd /app && composer --ansi install'"; then
    echo "installing composer dependencies failed"
    exit 1
  fi
fi

xcompose "up -d"
echo "done"
