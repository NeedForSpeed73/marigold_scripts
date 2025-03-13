#!/bin/bash
#

DIR=$HOME/Marigold/workspace
FOLDER_ID=1V5vpLPnBsOlrodtas2o_KAvMiekzxkeU

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 8_upload_video_gdrive3.sh. <video file>"
else
	if ! [ -f $1 ]; then
		printf %"s\n" "File " $1 " not found."
	else
		if ! $HOME/gdrive account list; then
			$HOME/gdrive account add emiliofesocchi@gmail.com
		fi
	$HOME/gdrive files upload --parent $FOLDER_ID $1	
	fi
fi