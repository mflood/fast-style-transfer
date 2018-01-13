#! /bin/bash

echo "You need 15GB space to download data set and 26 GB space to extract it"
df -h

echo "Creating data/ directory"
mkdir data

cd data
echo "Downloading imagenet-vgg-verydeep-19.mat"
wget http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
# for mac
#curl -O  http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat

mkdir bin

echo "Downloading training data"
wget http://msvocds.blob.core.windows.net/coco2014/train2014.zip
# For MAC
#curl -O  http://msvocds.blob.core.windows.net/coco2014/train2014.zip


echo "Unzipping training data"
unzip train2014.zip

