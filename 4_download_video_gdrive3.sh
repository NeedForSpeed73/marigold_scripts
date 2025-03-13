#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 4_download_video_gdrive3.sh <video file>"
else
	if ! $HOME/gdrive account list; then
		$HOME/gdrive account add emiliofesocchi@gmail.com
	fi
	read -e -p "Enter video file Google Drive Link: " VIDEO_LINK
	VIDEO_ID="$(echo "$VIDEO_LINK" | awk -F"/" '{print $6}')"
	VIDEO_FILENAME=$HOME/gdrive files info $VIDEO_ID | grep Name | sed -r 's/Name: //'
	if [ -f $DIR/$VIDEO_FILENAME ]; then
		$HOME/gdrive files download --overwrite $VIDEO_ID
	else
		$HOME/gdrive files download $VIDEO_ID
	fi
fi