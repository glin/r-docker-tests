# HTTP mirror to support R 3.1
options(repos = c("https://cloud.r-project.org", "http://cloud.r-project.org"))

tidyverse_pkgs <- c("tidyverse", tools::package_dependencies("tidyverse", db = available.packages())$tidyverse)

# Test output dir
out_dir <- "./output"
dir.create(out_dir, showWarnings = FALSE)

# Run tests for all tidyverse packages
for (pkg in tidyverse_pkgs) {
  status <- tools::testInstalledPackage(pkg, type = "tests", outDir = out_dir)
  if (status != 0) {
    stop(sprintf("%s tests failed", pkg))
  }
}

# Test examples for all tidyverse packages
for (pkg in tidyverse_pkgs) {
  status <- tools::testInstalledPackage(pkg, type = "examples", outDir = out_dir)
  if (status != 0) {
    stop(sprintf("%s examples failed", pkg))
  }
}
