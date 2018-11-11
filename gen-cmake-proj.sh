
#!/bin/bash

usage ()
{
  echo 'Usage : Script project-dir'
  exit
}

if [ "1" -ne 1 ]
then
  usage
fi

PROJECT_DIR=$1
BUILD_DIR=${PROJECT_DIR}/build

mkdir $BUILD_DIR
cd $BUILD_DIR
cmake -G"Unix Makefiles" -D CMAKE_BUILD_TYPE=Debug -D CMAKE_TOOLCHAIN_FILE=/home/developer/rpi-toolch/toolchainfile.cmake $PROJECT_DIR

cd $BUILD_DIR && make 

