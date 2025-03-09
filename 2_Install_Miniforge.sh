#!/bin/bash
#

# Install Miniforge
printf %"s\n" "" "* Downloading Miniforge3-"$(uname)-$(uname -m) ""
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

printf %"s\n" "" "* Installing Miniforge3-"$(uname)-$(uname -m) ""
bash "Miniforge3-"$(uname)-$(uname -m)".sh"  -b

printf %"s\n" "" "* Activating{} Miniforge3"
conda activate base

printf %"s\n" "" "* Cleaning Up" ""
rm "Miniforge3-"$(uname)-$(uname -m)".sh"