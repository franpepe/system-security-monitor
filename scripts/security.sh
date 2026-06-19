#!/bin/bash

# Location of auth Logs
LOGFILE="/var/log/auth.log"

# Output report file
REPORT="../reports/security_report.txt"

# Create reports directory if it doesn't exist
mkdir -p ../reports

# Overwrite old report and start fresh
echo "==== Security Report ====" > "$REPORT"
echo "Generated: $(date)" >> "REPORT"
echo "" >> "$REPORT"


# Failed SSH Login Attempts

echo "Failed SSH Login Attempts" >> "$REPORT"

# Search authentication logs for failed login attempts
grep "Failed password" "$LOGFILE" | tail -20 >> "REPORT"

echo ""  >> "$REPORT"

# Count  total failed logins
FAILED=$(grep -c "Failed password" "$LOGFILE")

echo "Total Failed Attempts: $FAILED" >> "$REPORT"

echo "" >> "$REPORT"


# Successful SSH Login Attempts

echo "Recent successful Logins" >> "$REPORT"

grep "Accepted password" "$LOGFILE" | tail -10 >> "$REPORT"

echo "" >> "$REPORT"

# Count successful logins
SUCCESS=$(grep -c "Accepted password" "$LOGFILE")

echo "Total Successful Logins: $SUCCESS" >> "$REPORT"

echo "" >> "$REPORT"

# Top Offending IP Addresses

echo "Top Offending IP Addresses" > "$REPORT"

grep "Failed password" "$LOGFILE" | awk '{print $(NF_3)}' | sort | uniq -c | sort -nr | head -10 >> "$REPORT"
echo "" > "$REPORT"

# Summary

echo "SUMMARY" >> "$REPORT"
echo "Failed Logins: $FAILED" >> "$REPORT"
echo "Successful Logins: $SUCCESS" >> "$REPORT"

# Alert if failures exceed threshold

if [ "$FAILED" -gt 20 ]; then
	echo "ALERT: Possible brute-force attack detected" >> "$REPORT"

	# write alert into system logs
	logger "ALERT: High number of failed SSH login attempts detected"
fi

echo "Report generated successfully"
