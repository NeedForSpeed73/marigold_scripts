#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 5_video2images.sh <video path>"
else
	if ! [ -f $1 ]; then
		printf %"s\n" "File $1 not found"
	else
		ffmpeg -i $1 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p" > $DIR/fps.txt
		ffmpeg -i $1 -qmin 1 -qscale:v 1 $DIR/input/%06d.jpg
	fi
fi

# Banner Message
printf %"s\n" "**********************************************************************************"
printf %"s\n" "* TO LAUNCH MARIGOLD WITH SCREEN EXECUTE:                 						*"
printf %"s\n" "* 'screen -S marigold bash -c "sh marigold_scripts/6_run_marigold.sh [--fast]'   *"
printf %"s\n" "**********************************************************************************"