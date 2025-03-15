#!/bin/bash
#

# Verify Platform
PLATFORM="$(uname -n)"
if [ $PLATFORM = "ubuntugpu" ]; then
	BASE=/mnt/fastdisk
else
	BASE=$HOME
fi

DIR=$BASE/workspace

if [ "$#" -ne 1 ]; then
	printf %"s\n" "Usage: 5_video2images.sh <video path>"
else
	if ! [ -f $1 ]; then
		printf %"s\n" "File $1 not found"
	else
		ffmpeg -i $1 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p" > $DIR/fps.txt
		ffmpeg -i $1 -qmin 1 -qscale:v 1 $DIR/input/%06d.jpg
	fi
	# Banner Message
	printf %"s\n" "**********************************************************************************"
	printf %"s\n" "* TO LAUNCH MARIGOLD WITH SCREEN EXECUTE:                                        *"
	printf %"s" "* screen -S marigold bash -c "
	printf '"sh marigold_scripts/6_run_marigold.sh [--fast]"    *\n'
	printf %"s\n" "**********************************************************************************"
fi