#!/bin/bash

git submodule init
git submodule update

./makeoverlay.sh

cd buildroot
make defconfig BR2_DEFCONFIG=../defconf
make
