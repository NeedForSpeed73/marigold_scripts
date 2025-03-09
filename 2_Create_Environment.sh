#!/bin/bash
#

#Install gdrive e ffmpeg
printf %"s\n" "" "* Installing gdrive (https://github.com/prasmussen/gdrive)" ""
wget https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_386.tar.gz
tar -xzf gdrive_2.1.1_linux_386.tar.gz
rm gdrive_2.1.1_linux_386.tar.gz

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

printf %"s\n" "" "* Downloading Marigold (https://github.com/prs-eth/Marigold.git) and installing requirements-cuda" ""
git clone https://github.com/prs-eth/Marigold.git
cd Marigold

CONDA_BASE=$(conda info --base)

# Create Environment
printf %"s\n" "" "* Creating Environment marigold" ""
mamba env create -n marigold --file environment.yaml
. $CONDA_BASE/etc/profile.d/conda.sh
conda info --envs
conda activate marigold
conda info --envs #check if env is activated

printf %"s\n" "" "* Installing FFMPEG" ""
mamba install -y ffmpeg

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
conda clean -y -a
