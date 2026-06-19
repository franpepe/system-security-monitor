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

ARCHIVING SCRIPT

a. Compresses reports
b. Stores them in archives/
c. Uses date based filenames

SETUP

git clone https://github.com/franpepe/system-security-monitor.git
cd sys_security_check
chmod +x scripts/security.sh
chmod +x scripts/archive_reports.sh

Run scripts

CRON AUTOMATION

0 * * * * /path/to/sys_security_check/scripts/security.sh
0 0 * * * /path/to/sys_security_check/scripts/archive_reports.sh

SKILLS DEMONSTRATED

Linux administration
Bash scripting
Log analysis
Security monitoring
Automation with cron
File archiving

FUTURE IMPROVEMENTS

Email Alerts
Real time monitoring
Automated threat detection

