#!/bin/bash
#

#Install CUDA Support
printf %"s\n" "" "* Downloading and installing CUDA for Ubuntu 22.04 x86_64" ""
IS_WSL="$(cat /proc/sys/fs/binfmt_misc/WSLInterop | grep enabled)"
if [ $IS_WSL = "enabled" ]; then
	wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
else	
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
fi
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt -y install cuda-toolkit-12-8
rm cuda-keyring_1.1-1_all.deb

# Install ffmpeg
printf %"s\n" "" "* Installing FFMPEG" ""
sudo apt install -y ffmpeg

#Install Python Virtual Environment
printf %"s\n" "" "* Installing Python3-venv" ""
sudo apt install -y python3-venv

printf %"s\n" "" "* Downloading Marigold (https://github.com/prs-eth/Marigold.git) and installing requirements-cuda" ""
git clone https://github.com/prs-eth/Marigold.git
cd Marigold

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt -y clean

# Create Environment
printf %"s\n" "" "* Creating Environment marigold" ""
python3 -m venv venv/marigold

# Banner Message
printf %"s\n" "" "***************************************************************"
printf %"s\n" "* NOW EXECUTE 'source Marigold/venv/marigold/bin/activate' TO ACTIVATE ENV *"
printf %"s\n" "***************************************************************" ""