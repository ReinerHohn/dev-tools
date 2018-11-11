#!/bin/bash

usage ()
{
  echo 'Usage : Script user remote destdir'
  exit
}

if [ "$#" -ne 3 ]
then
  usage
fi

USER=$1
REMOTE=$2
DESTDIR=$3

WORKDIR=$(pwd)
echo WORKDIR ist $WORKDIR

source $WORKDIR/create-rpi-toolch.sh $DESTDIR
source $WORKDIR/sync-rootfs.sh $USER $REMOTE $DESTDIR

# ROOTFS_DIR, TOOLCHAIN_DIR und TOOLCHAIN_TRIPLET müssen in create-rpi-toolch.sh gesetzt werden
source $WORKDIR/create-toolch-file.sh $TOOLCHAIN_DIR/$TOOLCHAIN_TRIPLET $ROOTFS_DIR $DESTDIR

# TOOLCHAIN_FILE muss in create-toolch-file.sh gesetzt werden
source $WORKDIR/gen-gen-cmake-proj.sh $TOOLCHAIN_FILE
