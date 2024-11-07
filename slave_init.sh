#!/bin/bash
set -e

# Wait for the master to be ready
until mysqladmin ping -h mysql-master --silent; do
  echo "Waiting for master to be ready..."
  sleep 5
done

# Get the log file and position from the master
MASTER_STATUS=$(mysql -h mysql-master -uroot -prootpassword -ANe "SHOW MASTER STATUS")
MASTER_LOG_FILE=$(echo $MASTER_STATUS | awk '{print $1}')
MASTER_LOG_POS=$(echo $MASTER_STATUS | awk '{print $2}')

# Configure the slave
mysql -uroot -prootpassword -e "
CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='replica_user',
  MASTER_PASSWORD='replica_password',
  MASTER_LOG_FILE='$MASTER_LOG_FILE',
  MASTER_LOG_POS=$MASTER_LOG_POS;
START SLAVE;
"
