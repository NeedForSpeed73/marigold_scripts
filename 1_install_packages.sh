#!/bin/bash
#

sudo apt update

# Install CUDA Support for WSL
IS_WSL="$(cat /proc/sys/fs/binfmt_misc/WSLInterop | grep enabled)"
printf %"s\n" "" "* Downloading and installing CUDA for Ubuntu WSL" ""
if [ $IS_WSL = "enabled" ]; then
	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
	sudo dpkg -i cuda-keyring_1.1-1_all.deb
	sudo apt -y install cuda-toolkit-12-8
	rm cuda-keyring_1.1-1_all.deb
fi

# Install ffmpeg
printf %"s\n" "" "* Installing FFMPEG" ""
sudo apt install -y ffmpeg

#Install SWAKS
printf %"s\n" "" "* Installing SWAKS (https://www.jetmore.org/john/code/swaks/)" ""
sudo apt install swaks

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt -y clean

cd /mnt/fastdisk

# Install gdrive
printf %"s\n" "" "* Installing gdrive3 (https://github.com/glotlabs/gdrive/tree/main) " ""
wget https://github.com/glotlabs/gdrive/releases/download/3.9.1/gdrive_linux-x64.tar.gz
tar -xvzf gdrive_linux-x64.tar.gz
rm gdrive_linux-x64.tar.gz

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