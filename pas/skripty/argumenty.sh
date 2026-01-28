#!/usr/bin/env bash

#echo"$0"

echo "\$*"
echo "$*"
#bere to ako jeden string
#for argument in "$*";do
#  echo "$argument"
#done

echo "\$@"
echo "$@"
#bere kazdy argument osobitne
#for argument in "$@";do
#  echo "$argument"
#done

echo "shift"

while [ -n "$*" ]
do
  echo "$1"

  case "$1" in
	--host=*)
	  host="${"$1:1"}" #$1 and remove first 7 chars
 	  shift
	  ;;
	--debug)
	  debug='true'
	  shift
	  ;;
	--help)
	  echo "$0 help:"
	  echo "supported arguments:"
	  echo "--host --debug --help"
	  exit 0
	  ;;
	*)
	  #default case
	  echo "Unknown argument $1"
	  echo "see $0 --help"
	  shift
	  ;;
  esac
done

if [ -z "$host" ]
then
  echo "Host not specified"
  echo "Host argument is mandatory"
  echo "see $0 --help"
  echo "Exiting..."
  exit 0
fi

echo "Your host is $host and your debug is $debug"
