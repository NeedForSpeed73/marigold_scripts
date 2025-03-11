#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 4_download_video_SFTP.sh. <video file> in folder Public"
else
	scp -P 24 emilio@emiliofederici.ddns.net:/share/CACHEDEV1_DATA/Public/$1 $DIR/output/$1
fi