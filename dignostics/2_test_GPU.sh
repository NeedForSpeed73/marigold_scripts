#!/bin/bash

python3 - <<END
import torch
if torch.cuda.is_available()
        print("Using:", torch.cuda.get_device_name(torch.cuda.current_device()))
END