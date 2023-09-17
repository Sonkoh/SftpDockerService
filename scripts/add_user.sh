#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Uso: $0 <username> <password> <storage>"
    exit 1
fi
user="$1"
password="$2"
storage=$(echo "$3 * 1073741824" | bc)
cd /root/service_sftp/
echo "$user:$password:1001" >> "./users.conf"
mkdir "/root/service_sftp/files/$user"
sudo chmod 777 "/root/service_sftp/files/$user"
sudo chown root -R "/root/service_sftp/files/$user"
echo "$storage" >> "./storage/$user"
docker-compose down
docker-compose up -d
echo "true"
