#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

ARG BASE_IMAGE=rstudio/r-base
FROM ${BASE_IMAGE}:3.1-centos7

RUN yum -y update && \
    yum -y install \
    git \
    gmp-devel \
    make \
    libcurl-devel \
    libjpeg-turbo-devel \
    libxml2-devel \
    openssl-devel

RUN yum install -y epel-release && \
    yum -y install \
        cairo-devel \
        gdal \
        gdal-devel \
        geos-devel \
        proj-devel \
        udunits2-devel

ENV PATH="/opt/rh/devtoolset-8/root/usr/bin:$PATH"

RUN R -e 'install.packages(c("rmarkdown", "shiny"), \
    dependencies = TRUE, Ncpus = 4, repos = "http://cloud.r-project.org")'

# Install tidyverse packages with tests and examples
RUN R -e 'options(repos = "http://cloud.r-project.org"); \
    for (pkg in c("tidyverse", tools::package_dependencies("tidyverse", db = available.packages())$tidyverse)) { \
        install.packages(pkg, dependencies = TRUE, Ncpus = 4, INSTALL_opts = c("--install-tests", "--example")) \
    }'
