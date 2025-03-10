#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 4_download_video_SFTP.sh."
else
	sftp emilio@emiliofederici.ddns.net:/share/Public/$1 $DIR/video.mp4
fi