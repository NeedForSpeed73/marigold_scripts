#!/bin/bash
#

DIR=$HOME/Marigold/workspace

VIDEO_FILE=$1

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_SFTP.sh. <video file> in folder Public"
else
	out_file=$DIR/$VIDEO_FILE
	sftp -P 24 emilio@emiliofederici.ddns.net <<EOF put $out_file share/CACHEDEV1_DATA/Public EOF
fi