#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 1 ]; then
	printf %"s\n" "Usage: 4_download_video_SFTP.sh. video file name in folder Public"
else
	sftp -P 24 emilio@emiliofederici.ddns.net:/share/CACHEDEV1_DATA/Public/$1 $DIR/video.mp4
fi