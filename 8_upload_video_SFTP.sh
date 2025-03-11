#!/bin/bash
#

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_SFTP.sh. <video file> in folder Public"
else
	if ![ -f $1 ]; then
		printf %"s\n" "File " $1 " not found."
	else
	#	sftp -P 24 emilio@emiliofederici.ddns.net <<< put $out_file /share/CACHEDEV1_DATA/Public
		scp -P 24 $1 emilio@emiliofederici.ddns.net:/share/CACHEDEV1_DATA/Public
	fi
fi