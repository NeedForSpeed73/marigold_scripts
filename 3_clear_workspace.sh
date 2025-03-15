#!/bin/bash

DIR=/mnt/fastdisk/Marigold/workspace

if ! [ -d "$DIR" ]; then
	printf %"s\n" "$DIR  does not exist."
	printf %"s\n" "* Creating $DIR."
	mkdir $DIR
	mkdir $DIR/input
	mkdir $DIR/output
fi
rm -r $DIR/input/*
rm -r $DIR/output/*
printf %"s\n" "Done."
