#!/bin/bash

DIR=$HOME/Marigold/workspace

if [ -d "$DIR" ]; then
    rm -r $DIR
    printf %"s\n" "Done."
else
	printf %"s\n" "$DIR  does not exist."
	printf %"s\n" "* Creating $DIR."
	mkdir $DIR
	mkdir $DIR/input
	mkdir $DIR/output
fi