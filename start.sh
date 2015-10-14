#!/usr/bin/env sh

. ./project.sh

if ! [ -d "$PROJECT_PATH/.git" ]; then
  echo "cloning php sources..."
  if ! xgit clone https://github.com/mazelab/php-slim-example "$PROJECT_PATH"; then
    echo "git clone failed"
    exit 1
  fi
fi

if ! [ -d "$PROJECT_PATH/vendor" ]; then
  echo "installing composer dependencies..."
  if ! xcompose "run --rm --no-deps web sh -c 'cd /app && composer install'"; then
    echo "installing composer dependencies failed"
    exit 1
  fi
fi

xcompose "up -d"
echo "done"
