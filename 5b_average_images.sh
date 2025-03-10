#!/bin/bash
#

DIR=$HOME/Marigold/workspace

if [ "$#" -gt 0 ] ; then
        printf %"s\n" "Usage: 5b_average_images"
else
        cd Marigold
        python3 ../python/average.py
fi
