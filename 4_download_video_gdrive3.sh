#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_video_gdrive3.sh"
else
	printf %"s" "Account GDrive attivo: "
	if ! $HOME/gdrive account list; then
		$HOME/gdrive account import $HOME/Marigold/gdrive_export-emiliofesocchi_gmail_com.tar
	fi
 
	read -p "Enter video file Google Drive Link: " VIDEO_LINK
 	VIDEO_ID="$(echo "$VIDEO_LINK" | awk -F"/" '{print $6}')"
 	$HOME/gdrive files download --destination $DIR --overwrite $VIDEO_ID
fi

# Remove spaces from filename
cd Marigold/workspace
for FILE in *.mp4
do
mv -- "$FILE" "${FILE//[[:space:]]/"_"}"
done