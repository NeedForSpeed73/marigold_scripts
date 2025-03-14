#!/bin/bash
#

printf %"s\n" "" "* Reactivate marigol Conda Environment" ""

. ./Marigold/conda/etc/profile.d/conda.sh
. ./Marigold/conda/etc/profile.d/mamba.sh

conda activate marigold