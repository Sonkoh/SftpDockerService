#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Uso: $0 <username>"
  exit 1
fi
cd /root/service_sftp/
username="$1"

archivo_temporal=$(mktemp)
while IFS= read -r linea; do
  IFS=":" read -r -a partes <<< "$linea"
  
  if [ "${partes[0]}" != "$username" ]; then
    echo "$linea" >> "$archivo_temporal"
  fi
done < "users.conf"

mv "$archivo_temporal" "users.conf"
rm -r "/root/service_sftp/home/$username"
rm "./storage/$username"
docker-compose down
docker-compose up -d
echo "true"
exit 1
