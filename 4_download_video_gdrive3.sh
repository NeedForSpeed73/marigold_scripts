#!/bin/bash
#

# Verify Platform
PLATFORM="$(uname -n)"
if [ $PLATFORM == "ubuntugpu" ]; then
	BASE=/mnt/fastdisk
else
	BASE=$HOME
fi

DIR=$BASE/Marigold/workspace

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_video_gdrive3.sh"
else
	printf %"s" "Account GDrive attivo: "
	if ! $BASE/gdrive account list; then
		$BASE/gdrive account import /mnt/fastdisk/Marigold/gdrive_export-emiliofesocchi_gmail_com.tar
	fi
 
	read -p "Enter video file Google Drive Link: " VIDEO_LINK
 	VIDEO_ID="$(echo "$VIDEO_LINK" | awk -F"/" '{print $6}')"
	$BASE/gdrive files download --destination $DIR --overwrite $VIDEO_ID

	#Rimuovi Spazi dal nome del file
	FILENAME="$($BASE/gdrive files info $VIDEO_ID | grep Name: | cut -c7- )"
	NEW_FILENAME="$(echo $FILENAME | tr -s ' ' '_')"
	mv "$DIR/$FILENAME" $DIR/$NEW_FILENAME
fi
