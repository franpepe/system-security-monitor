LINUX SECURITY MONITOR
This is a bash based solution for monitoring Linux auths logs, detecting suspicious login activity, generating reports and archiving them for future analysis.

FEATURES
a. Monitor SSH auth logs
b. Detect failed login attempts
c. Identify brute force attempts
d. Track successful logins
e. Generate security reports
f. Archive reports with tar
g. Automate tasks with cron

TECHNOLOGIES
Linux
Bash
grep,awk,sort,uniq,tar
Journalctl

PROJECT STRUCTURE

dunique@DESKTOP-HUL54K8:~/sys_security_check$ tree
.
├── README.md
├── archives
│   └── security_report_2026-06-19.tar.gz
├── reports
│   └── security_report.txt
└── scripts
    ├── REPORT
    ├── archive_reports.sh
    └── security.sh

HOW IT WORKS
a. Reads auth logs
b. Detects failed SSH logins
c. Counts successful logins
d. Flags repeated failures by IP
e. Generates a security report


