#!/usr/bin/bash

mkdir index_files_from_old_server

while read -r domain
do
  echo ==================================================
  echo $domain
  wget -q -O index_files_from_old_server/$domain  $domain
  echo ==================================================
done < <(cut -d ':' -f 1 /etc/userdomains | tail -n +2)
