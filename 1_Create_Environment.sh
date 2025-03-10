#!/bin/bash
#

#Install Nvidia Proprietary Drivers
#read -p "Do you want to install Nvidia Proprietary Drivers? (Y/N)" -r
#if [[ $REPLY =~ ^[Yy]$ ]]; then
#	printf %"s\n" "" "* Installing Nvidia Proprietary Drivers" ""
#	read -e -p "Enter Drivers File Google Drive ID: " DRIVERS_ID
#	./gdrive download $DRIVERS_ID
#	DRIVERS_FILENAME=`ls NVIDIA-Linux*`
#	sudo sh ./$DRIVERS_FILENAME
#	rm $DRIVERS_FILENAME
#fi

#Install CUDA Support
printf %"s\n" "" "* Downloading and installing CUDA for Ubuntu 22.04 x86_64" ""
IS_WSL="$(cat /proc/sys/fs/binfmt_misc/WSLInterop | grep enabled)"
if [ $IS_WSL = "enabled" ]; then
	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
else	
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
fi
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-8

printf %"s\n" "" "* Downloading Marigold (https://github.com/prs-eth/Marigold.git) and installing requirements-cuda" ""
git clone https://github.com/prs-eth/Marigold.git
cd Marigold

# Create Environment
printf %"s\n" "" "* Creating Environment marigold" ""
wget -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b -p "${HOME}/conda"
. "${HOME}/conda/etc/profile.d/conda.sh"
# For mamba support also run the following command
. "${HOME}/conda/etc/profile.d/mamba.sh"
mamba env create -n marigold --file environment.yaml
conda activate marigold

printf %"s\n" "" "* Installing FFMPEG" ""
sudo apt install -y ffmpeg

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt-get -y clean
