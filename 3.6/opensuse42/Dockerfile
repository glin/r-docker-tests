#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

ARG BASE_IMAGE=rstudio/r-base
FROM ${BASE_IMAGE}:3.6-opensuse42

RUN zypper --non-interactive --gpg-auto-import-keys -n install \
    curl \
    gdal \
    gdal-devel \
    geos-devel \
    git \
    gmp-devel \
    libcurl-devel \
    libproj-devel \
    libjpeg8-devel \
    libopenssl-devel \
    libxml2-devel \
    make \
    xorg-x11-server \
    xvfb-run

RUN R -e 'install.packages(c("rmarkdown", "shiny"), \
    dependencies = TRUE, Ncpus = 4, repos = "http://cloud.r-project.org")'

# Install tidyverse packages with tests and examples
RUN R -e 'options(repos = "http://cloud.r-project.org"); \
    for (pkg in c("tidyverse", tools::package_dependencies("tidyverse", db = available.packages())$tidyverse)) { \
        install.packages(pkg, dependencies = TRUE, Ncpus = 4, INSTALL_opts = c("--install-tests", "--example")) \
    }'
