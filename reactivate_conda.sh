#!/bin/bash
#

printf %"s\n" "" "* Reactivate marigol Conda Environment" ""

source Marigold/conda/etc/profile.d/conda.sh
source Marigold/conda/etc/profile.d/mamba.sh

conda activate marigold