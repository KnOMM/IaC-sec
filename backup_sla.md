# Backup SLA Documentation

## Database Servers

### Backup Coverage
- What is Backed Up:
  - MySQL: Critical databases containing user data, transaction history, and configurations.
  - InfluxDB: Time-series data crucial for performance monitoring and analytics.

- What is Not Backed Up:
  - Non-essential databases used for testing purposes.
  - Temporarily generated data that can be recreated.

### RPO (Recovery Point Objective)
- Define the maximum allowable data loss: 24 hours for MySQL, 24 hours for InfluxDB.

### Versioning and Retention
- Backup Versions: Retain the last 30 backups for MySQL, and the last 30 backups for InfluxDB.
- Duration: Keep backups for 30 days.

### Usability Checks
- Regularly perform restoration drills to ensure the backup's usability.
- Automate verification scripts to check the integrity of the backup files.

### Restoration Criteria
- MySQL: Restore in case of critical data corruption or accidental deletion.
- InfluxDB: Restore if there's a failure impacting the integrity of time-series data.

### RTO (Recovery Time Objective)
- Define the acceptable time to restore services after a failure:
  - MySQL: 3 hours.
  - InfluxDB: 3 hours.

### Restore Procedures 
- Reffer to backup_restore.md