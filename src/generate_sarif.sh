#!/bin/bash
set -e  # Exit on error

# Clone the required repository
git clone --branch sandeep/sarif-poc --single-branch https://github.com/ShiftLeftSecurity/field-integrations report

# Install dependencies
pip3 install -r report/shiftleft-utils/requirements.txt

# Generate SARIF report
python3 report/shiftleft-utils/export.py --app "${GITHUB_REPOSITORY_OWNER}-${GITHUB_REPOSITORY#*/}" --format "sarif" --report_file report/qwiet-sarif-report.sarif

# Ensure correct permissions
chmod -R 777 report