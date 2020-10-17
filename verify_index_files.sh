#!/usr/bin/bash

mkdir index_files_from_new_server

while read -r domain
do
  echo ==================================================
  echo $domain
  echo $domain >> success_list
  wget -q -O index_files_from_new_server/$domain  $domain
  cmp --silent index_files_from_old_server/$domain index_files_from_new_server/$domain || sed -i '$ d' success_list
  grep $domain success_list || echo $domain >> failed_list
  echo ==================================================
done < <(cut -d ':' -f 1 /etc/userdomains | tail -n +2)

# rm -rf index_files_from_old_server index_files_from_new_server
