#!/bin/bash

MY_STYLE_NAME=flood_test


echo "Activating style-transfer env"
source activate style-transfer

function setup_convert() {
    echo "Setting up output directory"
    mkdir -p applied_output/$MY_STYLE_NAME/
}

function convert() {
    IMAGE_NAME=$1
   
    echo "converting input/$IMAGE_NAME to ./applied_output/$MY_STYLE_NAME/$IMAGE_NAME"
    python evaluate.py --checkpoint train_output/$MY_STYLE_NAME --in-path input/$IMAGE_NAME --out-path ./applied_output/$MY_STYLE_NAME/$IMAGE_NAME

}

setup_convert

input_set=`ls ./input`

for thing in $input_set; do
    convert $thing
done


