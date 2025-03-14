#!/bin/bash
#

DIR=$HOME/Marigold/workspace
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
		if ! $HOME/gdrive account list; then
			$HOME/gdrive account import $HOME/Marigold/gdrive_export-emiliofesocchi_gmail_com.tar
		fi
		IS_PRESENT="$($HOME/gdrive files list --parent $FOLDER_ID | awk -F ' ' '{print $2}' | grep $FILE_NAME)"
		if [ ! -z "$IS_PRESENT" ]; then
			FILE_ID="$($HOME/gdrive files list --parent $FOLDER_ID | grep $FILE_NAME | awk -F ' ' '{print $1}')"
			$HOME/gdrive files update $FILE_ID $1
		else
			$HOME/gdrive files upload --parent $FOLDER_ID $1	
		fi
	fi
fi