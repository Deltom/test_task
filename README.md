# Static Analysis with Clang

## Build the image
```bash
podman build -t libxml2-sa ./static-analysis
```
## Run analysis
```bash
podman run --rm -v $(pwd)/static-analysis/reports:/report libxml2-sa
```
## View results
HTML report is created in static-analysis/reports/ under a timestamped subdirectory (e.g., 2026-02-20-123456-1). Open index.html in a browser.
