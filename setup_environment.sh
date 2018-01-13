#!/bin/bash
conda create -n style-transfer python=2.7.9
source activate style-transfer
pip install tensorflow
conda install scipy pillow


pip install moviepy
python setup_ffmpeg.py 

