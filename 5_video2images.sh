#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 5_video2images.sh <video.mp4>"
else
	ffmpeg -i $DIR/$1 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p" > $DIR/fps.txt
	ffmpeg -i $DIR/$1 -qmin 1 -qscale:v 1 $DIR/input/%06d.jpg
fi
