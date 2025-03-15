#!/bin/bash
#

# Verify Platform
PLATFORM="$(uname -n)"
if [ $PLATFORM == "ubuntugpu" ]; then
	BASE=/mnt/fastdisk
else
	BASE=$HOME
fi

DIR=$BASE/Marigold

#Create Environment
printf %"s\n" "" "* Creating Marigold environment" ""

cd $BASE/Marigold
mamba env create -n marigold --file environment.yaml

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW EXECUTE 'conda activate marigold'"
printf %"s\n" "***************************************************************" ""

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* Now copy gdrive account and swaks passwork files in Marigold with sshfs"
printf %"s\n" "***************************************************************" ""