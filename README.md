# Infrastructure Setup and Backup Restoration

## About the Project

This project aims to set up a scalable, secure, and monitored infrastructure using Ansible. The setup includes various services such as MySQL, InfluxDB, DNS, and monitoring tools like Prometheus and Grafana. The infrastructure is designed to ensure high availability, data integrity, and robust monitoring capabilities.

## Prerequisites

- Ensure you have Ansible installed.
- Configure the `hosts` inventory file as needed.
- Store the Ansible Vault password in `~/.ansible/vault_password`.

## Infrastructure Setup

Run the following command to install and configure the infrastructure:

```bash
ansible-playbook infra.yaml
```

## Backup Restoration

### MySQL Data Restoration

Refer to the `backup_restore.md` file for detailed steps on restoring MySQL data from the backup.

#### Verification
Check the MySQL restore by verifying the data in the `agama` database. Ensure the restored items are present.

### InfluxDB Data Restoration

Refer to the `backup_restore.md` file for detailed steps on restoring InfluxDB data from the backup.

#### Known Issues
You may encounter errors like:
```
error updating meta: DB metadata not changed. database may already exist
restore: DB metadata not changed. database may already exist
```
These can be ignored as long as the `telegraf` database is restored correctly.

#### Verification
Verify the InfluxDB restore by checking the logs and ensuring data is present in the `telegraf` database.

## Final Steps

After verifying the backups, run the Ansible playbook again:

```bash
ansible-playbook infra.yaml
```

## Backup SLA Documentation

For detailed information on backup coverage, RPO, RTO, versioning, retention, usability checks, and restoration criteria, refer to the `backup_sla.md` file.
```
