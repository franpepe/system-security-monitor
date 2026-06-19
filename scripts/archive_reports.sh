#!/bin/bash

DATE=$(date +%F)

# Ensure archive directory exists
mkdir -p ../archives

# Compress report into a tar.gz archive
tar -czf ../archives/security_report_$DATE.tar.gz ../reports/security_report.txt

echo ""
echo "Archive created successfully."
