#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_video_gdrive3.sh"
else
	printf %"s" "Account GDrive attivo: "
	if ! $HOME/gdrive account list; then
		$HOME/gdrive account add > /dev/null 2>&1
	fi
	read -p "Enter video file Google Drive Link: " VIDEO_LINK
	VIDEO_ID="$(echo "$VIDEO_LINK" | awk -F"/" '{print $6}')"
	VIDEO_FILENAME="$($HOME/gdrive files info $VIDEO_ID | grep Name | sed -r 's/Name: //')"
	if [ -f $DIR/$VIDEO_FILENAME ]; then
		$HOME/gdrive files download --destination $DIR --overwrite $VIDEO_ID
	else
		$HOME/gdrive files download --destination $DIR $VIDEO_ID
	fi
fi
