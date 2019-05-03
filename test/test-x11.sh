#!/usr/bin/env bash
set -ex

# Start a virtual X server
Xvfb &

export DISPLAY=":0"

Rscript -e 'X11(); plot(1); dev.off()'

# Stop the server
kill $!
