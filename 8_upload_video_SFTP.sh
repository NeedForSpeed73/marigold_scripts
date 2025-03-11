#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_SFTP.sh. <video file> in folder Public"
else
#	sftp -P 24 emilio@emiliofederici.ddns.net <<< put $out_file /share/CACHEDEV1_DATA/Public
	scp -P 24 $DIR/output/$1 emilio@emiliofederici.ddns.net:/share/CACHEDEV1_DATA/Public 
fi