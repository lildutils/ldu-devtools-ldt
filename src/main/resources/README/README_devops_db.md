# DevOps @ {{ VPS }

## Database

### install

Setup the prerequisities of the devops database

1) Create a Docker Network for database container

``` sh
docker network create $networkName
```

2) Create the required /data folder

``` sh
mkdir ~/devops/db/data
```

3) Create the required /dumps folder

``` sh
mkdir ~/devops/db/dumps
```

4) Create the docker-compose.yml file

``` sh
nano ~/devops/db/docker-compose.yml
```

5) Download the LDutils DevOps DEV-INF/db scripts into /DEV-INF folder

``` sh
wget https://github.com/lildutils/ldu-devtools-devinf.git#1.5.1
```

6) Set the configurations in /DEV-INF/configs.json file

### run

Setup the MySQL Server Docker Container with docker-compose by docker-compose.yml file

``` sh
./DEV-INF/run.sh
```

### stop

Stop the MySQL Server Docker Container with docker-compose

``` sh
./DEV-INF/stop.sh
```

### create a dump

Creates a dump backup by the given database

``` sh
./DEV-INF/backup.sh $databaseName
```

### restore

Restore the given database to the given dump file

``` sh
./DEV-INF/restore.sh $databaseName $databaseDumpFile
```

### crontab

## setup crontab for automated backups

First install postfix to send error emails

``` sh
sudo apt-get install postfix
```

Edit crontab

``` sh
crontab -e
```

Set the backup frequency

### run db backup in every day at every 10. minute

``` sh
echo '*/10 * * * * ~/devops/database/DEV-INF/backup_cron.sh>>~/devops/.logs/backup_cron_sh.log'
```

### run db backup in every monday at midnight

``` sh
echo '0 0 * * mon ~/devops/database/DEV-INF/backup_cron.sh>>~/devops/.logs/backup_cron_sh.log'
```

## read crontab system logs

``` sh
sudo grep CRON /var/log/syslog
```

## read crontab DEV-INF/db logs

``` sh
tail -f -n 50 ~/devops/.logs/backup_cron_sh.log
```

## 

Chears :)
