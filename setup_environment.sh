#!/bin/bash

# roll your own
function normal() {
    conda create -n style-transfer python=2.7.9
    source activate style-transfer
    pip install tensorflow
    conda install scipy pillow


    pip install moviepy
    python setup_ffmpeg.py 
}

# for machine that has tensorflow_p27 conda setup
function tf() {
    source activate tensorflow_p27
    pip install moviepy
    python setup_ffmpeg.py 
}

tf
