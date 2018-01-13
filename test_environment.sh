#!/bin/bash


echo "Activating style-transfer env"
source activate style-transfer


function test_apply() {
    echo "Applying style to test image"
    python evaluate.py --checkpoint styles/rain-princess.ckpt --in-path examples/content/chicago.jpg --out-path ./applied_output/rain-princess-chicago.jpg
    }




function setup_train() {
    echo "Setting up small data test set"
    mkdir -p style_output/test_checkpoint
    mkdir -p test_output
    mkdir -p data/small_train
    cp data/train2014/COCO_train2014_0000001111*.jpg data/small_train
}


function test_train() {
    echo "Trying to train a test style"
    python style.py --style examples/style/rain_princess.jpg \
    --checkpoint-dir style_output/test_checkpoint \
    --train-path data/small_train \
    --test examples/content/chicago.jpg \
    --test-dir test_output \
    --content-weight 1.5e1 \
    --checkpoint-iterations 500 \
    --batch-size 4
}

test_apply
setup_train
test_train
