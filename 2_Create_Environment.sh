#!/bin/bash
#

#Install gdrive e ffmpeg
printf %"s\n" "" "* Installing gdrive (https://github.com/glotlabs/gdrive)" ""
wget https://github.com/glotlabs/gdrive/releases/download/3.9.1/gdrive_linux-x64.tar.gz
tar -xzf gdrive_linux_x64.tar.gz
rm gdrive_linux_x64.tar.gz

printf %"s\n" "" "* Installing FFMPEG (package ffmpeg)" ""
sudo apt -y install ffmpeg

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

# Create Environment
printf %"s\n" "" "* Creating Environment marigold" ""
mamba env create -n marigold --file environment.yaml
conda activate marigold

# Clean packagers
printf %"s\n" "" "* Cleaning Up" ""
sudo apt-get -y clean
conda clean -y -a
