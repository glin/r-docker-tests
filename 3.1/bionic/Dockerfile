#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

ARG BASE_IMAGE=rstudio/r-base
FROM ${BASE_IMAGE}:3.1-bionic

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gdal-bin \
    git \
    libcairo-dev \
    libcurl4-openssl-dev \
    libgdal-dev \
    libgeos-dev \
    libgmp3-dev \
    libjpeg-dev \
    libproj-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libxt-dev \
    make

RUN R -e 'install.packages(c("rmarkdown", "shiny"), \
    dependencies = TRUE, Ncpus = 4, repos = "http://cloud.r-project.org")'

# Install tidyverse packages with tests and examples
RUN R -e 'options(repos = "http://cloud.r-project.org"); \
    for (pkg in c("tidyverse", tools::package_dependencies("tidyverse", db = available.packages())$tidyverse)) { \
        install.packages(pkg, dependencies = TRUE, Ncpus = 4, INSTALL_opts = c("--install-tests", "--example")) \
    }'
