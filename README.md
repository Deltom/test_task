# SAST / Fuzzing 

## Prerequisites

The following dependency is required to run all stages of the project:

- Podman (used for building and running containers)

On ALT Linux, Podman can be installed with:
```bash
apt-get install podman
```

### Build the base image
```bash
./do_some_tests
```
## SAST

### Run static analysis
```bash
./do_some_tests static
```
### View results
HTML report is created in **static-analysis/reports/** under a timestamped subdirectory (e.g., 2026-02-20-123456-1). Open **index.html** in a browser.

### Manual triage of selected findings

The manual analysis and classification of three selected static analysis warnings is available in the triage/ directory. 

## Fuzzing 

### Run dynamic analysis
```bash
./do_some_tests fuzzing
```

### Summary about fuzzing
A short summary of fuzzing is available in the `fuzzing/` directory, in the `summary.md` file.

### View results
Report is created in **fuzzing/reports/**

## Help
```bash
./do_some_tests --help
```

## How the script works

The script automates building and running static analysis and fuzzing for libxml2 using Podman.

### Logic:

    Checks if the base image libxml2-base exists — if not, builds it from ./base

    Depending on the argument, runs either static analysis or fuzzing

    Builds specialized images and mounts result directories

### Commands:

```bash
# Build base image
podman build -t libxml2-base ./base

# Build static analysis image
podman build -t libxml2_sa ./static-analysis

# Run static analysis
podman run --rm -v $(pwd)/static-analysis/reports:/report libxml2_sa

# Build fuzzing image
podman build -t libxml2_fz ./fuzzing

# Run fuzzing
podman run --rm -it -v $(pwd)/fuzzing/reports:/src/libxml2/out libxml2_fz
```
