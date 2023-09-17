#!/bin/bash
# sudo sed -i 's/\(\S*\s*\/\s*\S*\s*\S*\s*\)\(.*\)/\1usrquota,grpquota \2/' /etc/fstab

file="/etc/sftp/users.conf"

while IFS= read -r line; do
    IFS=":" read -r user password uid <<< "$line"
    limit="1"
    folder="/home/$user"
    sudo quotacheck -cug $folder
    sudo quotaon $folder
    sudo edquota -u $user << EOF
$user
$folder
$limit
$limit
EOF
  quota -u $user
done < "$file"