#!/bin/bash
#

#Install CUDA Support for WSL
IS_WSL="$(cat /proc/sys/fs/binfmt_misc/WSLInterop | grep enabled)"
printf %"s\n" "" "* Downloading and installing CUDA for Ubuntu WSL" ""
if [ $IS_WSL = "enabled" ]; then
	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
fi
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt -y install cuda-toolkit-12-8
rm cuda-keyring_1.1-1_all.deb

# Install ffmpeg
printf %"s\n" "" "* Installing FFMPEG" ""
sudo apt install -y ffmpeg

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt -y clean

printf %"s\n" "" "* Downloading Marigold (https://github.com/prs-eth/Marigold.git) and installing requirements-cuda" ""
git clone https://github.com/prs-eth/Marigold.git
cd Marigold

# Install Miniforge3
printf %"s\n" "" "* Downloading and installing Miniforge-3-$(uname)-$(uname -m).sh"
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/Marigold/conda"
rm Miniforge3.sh

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW EXECUTE 'source Marigold/conda/etc/profile.d/conda.sh'"
printf %"s\n" "* NOW EXECUTE 'source Marigold/conda/etc/profile.d/mamba.sh'"
printf %"s\n" "* NOW EXECUTE 'conda activate'"
printf %"s\n" "***************************************************************" ""