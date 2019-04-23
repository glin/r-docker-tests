#!/usr/bin/env bash
set -ex

DIR="$(dirname "$(readlink -f "$BASH_SOURCE")")"

# Render to HTML and PDF
cd $DIR && Rscript -e 'rmarkdown::render("doc.Rmd", c("html_document", "pdf_document"), output_dir = "output")'
