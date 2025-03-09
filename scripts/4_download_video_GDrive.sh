#!/bin/bash
#

DIR=$HOME/Marigold/workspace

VIDEO_ID_FILE=$DIR/video.id

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_video_GDrive.sh."
else
	if [ ! -f "$VIDEO_ID_FILE" ]; then
		read -e -p "Enter <video.mp4> Google Drive Link: " VIDEO_LINK
		VIDEO_ID="$(echo "$VIDEO_LINK" | awk -F "/" '{print $6}')"
		touch $VIDEO_ID_FILE
		echo $VIDEO_ID > $VIDEO_ID_FILE
	else
		VIDEO_ID=$(<$VIDEO_ID_FILE)
		printf %"s\n"
	fi
	gdown --id $VIDEO_ID
fi