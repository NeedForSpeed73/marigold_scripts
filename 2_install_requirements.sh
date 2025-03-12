#!/bin/bash
#

DIR=$HOME/Marigold

#Install dependencies
printf %"s\n" "" "* Installing marigold requirements" ""

cd Marigold
pip install -r $DIR/requirements.txt