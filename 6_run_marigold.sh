#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 1 ]; then
	printf %"s\n" "Usage: 6_run_marigold.sh <--fast>"
else
	if [ $1 = "--fast" ]; then
		echo "Using LCM (faster) setting."
		python Marigold/run.py --input_rgb_dir $DIR/input --output_dir $DIR/output
	else
		echo "Using DDIM (paper) seting."
		python Marigold/run.py --checkpoint prs-eth/marigold-v1-0 --denoise_steps 50 --ensemble_size 10 --input_rgb_dir $DIR/input/ 
    --output_dir $DIR/output	
	fi
fi