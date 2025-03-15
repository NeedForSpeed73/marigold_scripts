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

if ! [ -d "$DIR" ]; then
	printf %"s\n" "$DIR  does not exist."
	printf %"s\n" "* Creating $DIR."
	mkdir $DIR
	mkdir $DIR/input
	mkdir $DIR/output
else
	rm -r $DIR/input/*
	rm -r $DIR/output/*
fi
printf %"s\n" "Done."
