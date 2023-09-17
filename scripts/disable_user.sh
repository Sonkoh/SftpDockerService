#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Uso: $0 <username>"
  exit 1
fi

username="$1"

archivo_temporal=$(mktemp)
cd /root/service_sftp/
while IFS= read -r linea; do
  IFS=":" read -r -a partes <<< "$linea"
  
  if [ "${partes[0]}" != "$username" ]; then
    echo "$linea" >> "$archivo_temporal"
  fi
done < "users.conf"

mv "$archivo_temporal" "users.conf"
docker-compose down
docker-compose up -d
echo "true"
exit 1
