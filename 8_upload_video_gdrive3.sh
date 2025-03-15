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
FOLDER_ID=1V5vpLPnBsOlrodtas2o_KAvMiekzxkeU
FILE_FULL_PATH=$1
FILE_NAME=${FILE_FULL_PATH##*/}

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_gdrive3.sh <video file>"
else
	if ! [ -f $1 ]; then
		printf %"s\n" "Errore: File $1 not found."
	else
		printf %"s" "Account GDrive attivo: "
		if ! $BASEgdrive account list; then
			$BASE/gdrive account import $HOME/Marigold/gdrive_export-emiliofesocchi_gmail_com.tar
		fi
		IS_PRESENT="$($BASE/gdrive files list --parent $FOLDER_ID | awk -F ' ' '{print $2}' | grep $FILE_NAME)"
		if [ ! -z "$IS_PRESENT" ]; then
			FILE_ID="$($BASE/gdrive files list --parent $FOLDER_ID | grep $FILE_NAME | awk -F ' ' '{print $1}')"
			$BASE/gdrive files update $FILE_ID $1
		else
			$BASE/gdrive files upload --parent $FOLDER_ID $1	
		fi
	fi
fi