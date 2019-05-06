# r-docker-tests

Extended test suite for the R Docker images.

Run all tests:
```sh
make test-all
```

Run individual tests:
```sh
# Run a Shiny app
make test-all TEST=shiny

# Compile R Markdown doc to HTML/PDF
make test-all TEST=rmarkdown

# Run tests/examples from Tidyverse packages
make test-all TEST=tidyverse

# Plot to a virtual X server
make test-all TEST=x11
```

### Building Images
```bash
# Build and test all images
make

# Build and test images for a specific R version
make VERSIONS=3.4

# Build and test images for a specific distro
make VARIANTS=xenial

# Build a specific image
make build-3.4-xenial

# Test a specific image
make test-3.4-xenial

# Rebuild a specific image
make rebuild-3.4-xenial

# Rebuild all images
make rebuild-all
```

### Updating Images
1. Update [`update.sh`](update.sh) and [Makefile](Makefile) with the new distro or R version
2. Generate new Dockerfiles:
```bash
make update-all

# Or, using Docker
make update-all-docker
```
