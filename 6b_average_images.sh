#!/bin/bash
#

# Verify Platform
PLATFORM="$(uname -n)"
if [ $PLATFORM == "ubuntugpu" ]; then
        BASE=/mnt/fastdisk
else
        BASE=$HOME
fi

cd $BASE/Marigold

if [ "$#" -gt 0 ]; then
        printf %"s\n" "Usage: 6b_average_images"
else
        cd Marigold
        python3 - << END
import os
import glob
import numpy as np

from PIL import Image

dir_in = './workspace/output/depth_bw'
dir_out = './workspace/output/averaged'
items = len(glob.glob(dir_in + '/*_pred.png')) - 2
first = dir_in + '/000001_pred.png'
last = dir_in + '/' + str(items + 2).zfill(6) + '_pred.png'
w, h = Image.open(first).size

file_count = 0
for path in os.listdir(dir_in):
        if os.path.isfile(os.path.join(dir_in, path)):
                file_count += 1

if not os.path.exists(dir_out):
        os.makedirs(dir_out)

Image.open(first).save(first.replace('depth_bw', 'averaged'))

for idx in range(items):
        current = idx + 2
        arr = np.zeros((h, w), np.float64)

        prev = np.array(Image.open(dir_in + '/' + str(current - 1).zfill(6) + '_pred.png'), dtype = np.float64)
        curr = np.array(Image.open(dir_in + '/' + str(current).zfill(6) + '_pred.png'), dtype = np.float64)
        next = np.array(Image.open(dir_in + '/' + str(current + 1).zfill(6) + '_pred.png'), dtype = np.float64)

        arr = arr+prev/3
        arr = arr+curr/3
        arr = arr+next/3

        arr = np.array(np.round(arr), dtype = np.uint16)

        out = Image.fromarray(arr,mode = 'I;16')
        out.save(dir_out + '/' + str(current).zfill(6) + '_pred.png')
        adv = current / file_count * 100
        adv = round(adv)
        print('Averaged: ' + str(current).zfill(6) + '._pred.png ' + str(current) + '/' + str(file_count) + ' ' + str(adv) + '%')

Image.open(last).save(last.replace('depth_bw', 'averaged'))
print('Done.')
END
fi