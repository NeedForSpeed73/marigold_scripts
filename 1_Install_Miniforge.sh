#!/bin/bash
#

# Install Miniforge
printf %"s\n" "" "* Downloading Minigforge3-latest"
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

printf %"s\n" "" "* Installing Minigforge3-latest"
bash Miniforge3.sh -b -p "${HOME}/conda"
. "${HOME}/conda/etc/profile.d/conda.sh"
# For mamba support also run the following command
. "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate