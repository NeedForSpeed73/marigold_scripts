#!/bin/bash

DIR=$HOME/Marigold/workspace

if [ -d "$DIR" ]; then
    rm $DIR/input/*.png
    rm -r $DIR/output/*
    printf %"s\n" "Done."
else
	printf %"s\n" "$DIR  does not exist."
	printf %"s\n" "* Creating $DIR."
	mkdir $HOME/workplace
	mkdir $HOME/workplace/input
	mkdir $HOME/workplace/output
fi