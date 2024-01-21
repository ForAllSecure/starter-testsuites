#!/usr/bin/env bash

TESTSUITES="testsuites"
mkdir -p ${TESTSUITES}

process_directory() {
  directory=$1
  echo -n "Working on $directory..."
  rm -Rf ${TESTSUITES}/${directory}-testsuite/testsuite
  mkdir -p ${TESTSUITES}/${directory}-testsuite/testsuite
  find $directory -type f -print0 | xargs -0 -I{} cp {} ${TESTSUITES}/${directory}-testsuite/testsuite
  tar zcf ${TESTSUITES}/${directory}-testsuite.tgz -C ${TESTSUITES}/${directory}-testsuite testsuite
  echo " Created ${TESTSUITES}/${directory}-testsuite.tgz"
}

if [ "$#" -eq 1 ]; then
    # If a directory name is provided as an argument
    process_directory $1
else
    # If no argument is provided, process all directories
    for directory in $(find . -type d -depth 1 -not \( -path ./${TESTSUITES} -o -path ./dictionaries -o -path ./.git -o -path ./testsuites \)); do
        dir_name=$(basename $directory)
        process_directory $dir_name
    done
fi


#for directory in `find . -type d -depth 1 -not \( -path ./${TESTSUITES} -o -path ./dictionaries -o -path ./.git -o -path ./testsuites \)`
#do
#  echo "Working on $directory"
#  mkdir -p ${TESTSUITES}/${directory}-testsuite/testsuite
#  find $directory -type f -print0 | xargs -0  -I{} cp {} testsuites/${directory}-testsuite/testsuite
#
#  
#  tar zcvf ${TESTSUITES}/${directory}-testsuite.tgz  -C testsuites/${directory}-testsuite testsuite
#done
