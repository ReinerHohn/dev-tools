#!/bin/bash

usage ()
{
  echo 'Usage : Script toolchainfile'
  exit
}

if [ "$#" -ne 1 ]
then
  usage
fi

TOOLCH_FILE=$1

echo "
#!/bin/bash

usage ()
{
  echo 'Usage : Script project-dir'
  exit
}

if [ \"$#\" -ne 1 ]
then
  usage
fi

PROJECT_DIR=\$1
BUILD_DIR=\${PROJECT_DIR}/build

if [ -d \$BUILD_DIR ]; then
	rm -rf \$BUILD_DIR
fi

mkdir \$BUILD_DIR
cd \$BUILD_DIR
cmake -G\"Unix Makefiles\" -D CMAKE_BUILD_TYPE=Debug -D CMAKE_TOOLCHAIN_FILE=$TOOLCH_FILE \$PROJECT_DIR

cd \$BUILD_DIR && make 
" > gen-cmake-proj.sh

chmod +x gen-cmake-proj.sh
