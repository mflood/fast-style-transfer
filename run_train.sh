#!/bin/bash

MY_STYLE_NAME=flood_test
TRAINING_IMAGE=train_input/training_image.jpg

#echo "Activating style-transfer env"
#source activate style-transfer

echo "Activating tensorflow env"
source activate tensorflow_p27

function setup_train() {
    echo "Setting up train directories"
    mkdir -p train_output/$MY_STYLE_NAME
    mkdir -p test_output
}

function train() {
    echo "Training style $MY_STYLE_NAME using $TRAINING_IMAGE"
    python style.py --style $TRAINING_IMAGE \
    --checkpoint-dir train_output/$MY_STYLE_NAME \
    --train-path data/train2014 \
    --test examples/content/chicago.jpg \
    --test-dir test_output \
    --content-weight 1.5e1 \
    --checkpoint-iterations 1000 \
    --batch-size 4
}

setup_train
train
