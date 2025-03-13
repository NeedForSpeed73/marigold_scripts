#!/bin/bash
#

DIR=$HOME/Marigold/workspace
FPS_FILE=$DIR/fps.txt

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 6_images2video.sh <video filename without '_depth.mp4'>"
else
	if [ -f $FPS_FILE ]; then
		FPS="$(cat $FPS_FILE)"
		if [ -f $DIR/$1_depth.mp4 ]; then
			rm $DIR/$1_depth.mp4
		fi
		if [ -d "$DIR/output/averaged" ]; then
			ffmpeg -framerate $FPS -i $DIR/output/averaged/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/$1_depth.mp4
			rm $FPS_FILE
		else
			ffmpeg -framerate $FPS -i $DIR/output/depth_bw/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/$1_depth.mp4
			rm $FPS_FILE
		fi
	else
		printf %"s\n" "Error: File fps.txt not found."
	fi
fi
