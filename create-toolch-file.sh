#!/bin/bash

usage ()
{
  echo 'Usage : Script compiler-dir-prefix rootfs-dir destdir'
  exit
}

if [ "$#" -ne 3 ]
then
  usage
fi

COMPILER_DIR_PREFIX=$1
SYSROOT_DIR=$2
DESTDIR=$3
TOOLCHAIN_FILE=$DESTDIR/toolchainfile.cmake

echo "SET(CMAKE_SYSTEM_NAME Linux)" > $TOOLCHAIN_FILE
echo "SET(CMAKE_SYSTEM_VERSION 1)" >> $TOOLCHAIN_FILE
# specify the cross compiler
echo "SET(CMAKE_C_COMPILER \"$COMPILER_DIR_PREFIX-gcc\")" >> $TOOLCHAIN_FILE
echo "SET(CMAKE_CXX_COMPILER \"$COMPILER_DIR_PREFIX-g++\")" >> $TOOLCHAIN_FILE

echo "SET(CMAKE_C_FLAGS \"\${CMAKE_C_FLAGS} -g -O0\")" >> $TOOLCHAIN_FILE

# where is the target environment
echo "SET(CMAKE_FIND_ROOT_PATH \"$SYSROOT_DIR\")" >> $TOOLCHAIN_FILE
# search for programs in the build host directories
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> $TOOLCHAIN_FILE
# for libraries and headers in the target directories
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> $TOOLCHAIN_FILE
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> $TOOLCHAIN_FILE
echo "SET(CMAKE_SYSROOT \"$SYSROOT_DIR\")" >> $TOOLCHAIN_FILE

echo "SET(ENV{PKG_CONFIG_SYSROOT_DIR} \"$SYSROOT_DIR\")" >> $TOOLCHAIN_FILE
echo "SET(ENV{PKG_CONFIG_DIR} \"\")" >> $TOOLCHAIN_FILE
echo "SET(ENV{PKG_CONFIG_LIBDIR} \"$SYSROOT_DIR/usr/lib/arm-linux-gnueabihf/pkgconfig:$SYSROOT_DIR/usr/share/pkgconfig\")" >> $TOOLCHAIN_FILE
echo "SET(ENV{PKG_CONFIG_PATH} \"$SYSROOT_DIR/usr/lib/arm-linux-gnueabihf/pkgconfig/\")" >> $TOOLCHAIN_FILE
