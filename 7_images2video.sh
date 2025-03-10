#!/bin/bash
#

DIR=$HOME/Marigold/workspace
FPS_FILE=$DIR/fps.txt

echo $FPS_FILE
if [ "$#" -gt 0 ]; then
	printf %"s\n" "Usage: 6_images2video.sh"
else
	if [ -f $FPS_FILE ]; then
		FPS="$(cat $FPS_FILE)"
		ffmpeg -framerate $FPS -i $DIR/output/averaged/%06d_pred.png -vcodec libx264 -pix_fmt yuv420p $DIR/output/video_depth.mp4
	else
		printf %"s\n" "Error: File fps.txt not found."
	fi
fi
