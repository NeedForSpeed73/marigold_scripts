#!/bin/bash
#

DIR=$HOME/Marigold

#Create Environment
printf %"s\n" "" "* Creating Marigold environment" ""

cd $HOME/Marigold
mamba env create -n marigold --file environment.yaml

# Banner Message
printf %"s\n" "***************************************************************"
printf %"s\n" "* NOW EXECUTE 'conda activate marigold'                       *"
printf %"s\n" "***************************************************************"

# Banner Message
printf %"s\n" "***************************************************************************"
printf %"s\n" "* Now copy gdrive account and swaks passwork files in $HOME with sshfs    *"
printf %"s\n" "***************************************************************************"