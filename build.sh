#!/bin/bash
mysql_root_pass='admin'
chmod +x ./bitrix-env.sh
chmod +x ./mysql.sh
mkdir -m 777 -p ./bitrix/local
mkdir -m 777 -p ./bitrix/backup
mkdir -m 777 -p ./bitrix/mysql
mkdir -m 777 -p ./bitrix/www
docker build -t  bitrix:win .
docker stop bitrix-win
docker rm bitrix-win
docker create --name bitrix-new --cap-add SYS_ADMIN --security-opt seccomp:unconfined --privileged \
              --hostname=bitrix \
              --tmpfs /tmp --tmpfs /run \
              -v /sys/fs/cgroup:/sys/fs/cgroup:ro  bitrix:win
docker start bitrix-win
docker exec -ti bitrix-win sh -c "/root/bitrix-env.sh -p -H  bitrix -M $mysql_root_pass;/root/menu.sh;bash"
docker exec -ti bitrix-win sh -c "/root/mysql.sh;exit"
docker stop bitrix-win
