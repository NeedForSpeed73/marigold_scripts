#!/bin/bash
#

DIR=$HOME/Marigold/workspace
FPS_FILE=$DIR/fps.txt

echo $FPS_FILE
if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 6_images2video.sh <video.mp4>"
else
	if [ -f $FPS_FILE ]; then
		FPS="$(cat $FPS_FILE)"
		ffmpeg -framerate $FPS -i $DIR/output/averaged/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/output/$1_depth.mp4
	else
		printf %"s\n" "Error: File fps.txt not found."
	fi
fi
