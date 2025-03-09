#!/bin/bash
#

# Install Miniforge
printf %"s\n" "" "* Downloading Miniforge3-"$(uname)-$(uname -m) ""
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

printf %"s\n" "" "* Installing Miniconda3-"$(uname)-$(uname -m) ""
bash Miniforge3.sh -b -p "${HOME}/conda"

printf %"s\n" "" "* Creating Path to conda and activate it"
source "${HOME}/conda/etc/profile.d/conda.sh"
printf %"s\n" "" "* Creating Path to mamba and activate it"
source "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate

printf %"s\n" "" "* Cleaning Up" ""
rm Miniforge3.sh