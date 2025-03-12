#!/bin/bash
#

DIR=$HOME/Marigold

#Create Environment
printf %"s\n" "" "* Creating Marigold environment" ""

cd Marigold
mamba env create -n marigold --file environment.yaml

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW EXECUTE 'conda activate marigold'"
printf %"s\n" "***************************************************************" ""