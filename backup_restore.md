Install and configure infrastructure with Ansible:

    ansible-playbook infra.yaml

Restore MySQL data from the backup:
```
rm -rf /home/backup/restore/mysql/
sudo -u backup duplicity --no-encryption restore rsync://KnOMM@backup.be.bop/mysql /home/backup/restore/mysql
mysql agama < /home/backup/restore/mysql/agama.sql
```
    

<add a few words here how the result of backup restore can be checked>
Delete all items from the agama list. Run the commands and you should see saved items

Restore InfluxDB data from the backup:
```
service telegraf stop
influx -execute 'DROP DATABASE telegraf'
influxd restore -portable -database telegraf /home/backup/restore/influxdb
```    
You may get these errors if restoring the database:
```
error updating meta: DB metadata not changed. database may already exist
restore: DB metadata not changed. database may already exist
```
It's a known issue with InfluxDB restore, you can ignore these. Just make sure that telegraf database is restored correctly.

After you have verified that backup was restore successfully, run
```
ansible-playbook infra.yaml
```
    
<add a few words here how the result of backup restore can be checked>
You can see log info from before in the syslog dashboard