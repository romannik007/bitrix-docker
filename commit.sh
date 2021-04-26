#!/bin/bash

docker start bitrix-win
docker exec bitrix-win sh -c "yum -y clean all;exit"
docker stop bitrix-win
docker commit bitrix-win romannik/bitrix:bitrix-base-new
echo "commit successful"