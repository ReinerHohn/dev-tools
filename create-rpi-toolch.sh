#!/bin/bash

usage ()
{
  echo 'Usage : Script destdir'
  exit
}

if [ "$#" -ne 1 ]
then
  usage
fi

DESTDIR=$1

mkdir -p $DESTDIR
cd $DESTDIR

git clone git://github.com/raspberrypi/tools.git

# TODO
echo Execute this: PATH=$PATH:$DESTDIR/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin

TOOLCHAIN_DIR=$DESTDIR/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/
TOOLCHAIN_TRIPLET=arm-linux-gnueabihf
