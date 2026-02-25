# SAST / Fuzzing 

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

### View results
Report is created in **fuzzing/reports/**

## Help
```bash
./do_some_tests --help
```
