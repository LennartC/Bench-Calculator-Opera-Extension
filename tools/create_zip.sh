#!/bin/sh

die () {
  echo "$1" > /dev/stderr
  exit 1
}

echo "Started build"

# make build directory and copy original files there for preflighting
rm -rf ../build
rm -rf ../simple-rest-client.oex
mkdir ../build
cp -R ../src/* ../build/
rm ../build/icon.svg
cp ../README ../build/

# zipping build to simple-rest-client.oex
echo "Creating ZIP archive for addons.opera.com"
dir=`pwd`
cd ../build/
zip ../bench-calculator.oex -rq *  || die "Failed to create ZIP"
rm -rf ../build
cd $dir
echo "Done"
