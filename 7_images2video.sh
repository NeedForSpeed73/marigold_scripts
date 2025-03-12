#!/bin/bash
#

DIR=$HOME/Marigold/workspace
FPS_FILE=$DIR/fps.txt

echo $FPS_FILE
if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 7_images2video.sh <video filename>"
else
	if [ -f $FPS_FILE ]; then
		FPS="$(cat $FPS_FILE)"
		if [ -f $DIR/output/$1_depth.mp4 ]; then
			rm $DIR/output/$1_depth.mp4
		fi
		if [ -d "$DIR/output/averaged" ]; then
			ffmpeg -framerate $FPS -i $DIR/output/averaged/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/output/$1_depth.mp4
		else
			ffmpeg -framerate $FPS -i $DIR/output/depth_bw/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/output/$1_depth.mp4
		fi
	else
		printf %"s\n" "Error: File fps.txt not found."
	fi
fi
