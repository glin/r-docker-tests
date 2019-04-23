#!/usr/bin/env bash
set -ex

DIR="$(dirname "$(readlink -f "$BASH_SOURCE")")"

# Run the test app on port 3000
Rscript -e "shiny::runApp('$DIR/app.R', port = 3000)" &

# Wait for server to start
timeout 10 bash -c 'until echo > /dev/tcp/localhost/3000; do sleep 0.5; done' > /dev/null 2>&1

curl localhost:3000

# Stop the server
kill $!
