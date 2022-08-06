#!/bin/bash

# replace it with runtime environment variables
sed -i "s/eval('\"__RUNTIME_ENV__.NAME\"')/\"$NAME\"/g" /app/dist/main.js
# validate that it is replaced
if grep -q __RUNTIME_ENV__ /app/dist/main.js; then
  echo "Error: runtime environments are not being replaced!"
  exit 1
fi

echo Project is running on port: 8080
nginx -g "daemon off;"
