#!/usr/bin/env bash
#set -x 
mypath="$(realpath "$0")"
mydir="$(dirname "$mypath")"
echo "$mypath"
echo "$mydir"
cd "$mydir"

exit 0

test -z "$1" && {
  echo"no 1st argument"
  echo"exiting..."
  exit 0 
}

#if [ -n "$1" ] ; then
#  echo"no first argument detected"
#  exit 0
#fi

text=$1

echo "$text" | sed 's/ //g'
echo "$text" | wc -m
touch "$text"

date > "$text"
# date > "$mydir/$text "
