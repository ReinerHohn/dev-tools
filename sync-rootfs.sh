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

ROOTFS_DIR=$DESTDIR/rootfs
mkdir -p $ROOTFS_DIR

rsync -rl --delete-after --safe-links $USER@$REMOTE:/{lib,usr} $ROOTFS_DIR
