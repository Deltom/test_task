#!/bin/bash
set -e
cd /src/libxml2
make clean
scan-build -o /report --use-cc=clang make -j$(nproc)
echo "Report saved in /report"
