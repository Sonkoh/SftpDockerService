#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Uso: $0 <username> <password>"
    exit 1
fi

user="$1"
password="$2"
cd /root/service_sftp/
echo "$user:$password:1001" >> "./users.conf"
docker-compose down
docker-compose up -d
echo "true"
exit 1
