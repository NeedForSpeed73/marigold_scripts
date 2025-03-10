#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_SFTP.sh. <video file> in folder Public"
else
	sftp -P 24 emilio@emiliofederici.ddns.net:/share/CACHEDEV1_DATA/Public/$1 <<< $'put {$DIR/$1}'
fi