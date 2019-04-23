#!/usr/bin/env bash
set -ex

DIR="$(dirname "$(readlink -f "$BASH_SOURCE")")"

$DIR/test-rmarkdown.sh
$DIR/test-shiny.sh
$DIR/test-tidyverse.sh
