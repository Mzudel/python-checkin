#!/usr/bin/env bash
set -e
body= echo || true

function pocetprav() {
  local points= echo || true
  local rbod='1'
  local wbod='10'
  local xbod='5'

  for ((i=0; i<${#1}; i++)); do
    #echo "${1:$i:1}"
    
    if [[ ${1:$i:1} == "r" ]];then {
	((points += rbod))
    } elif [[ ${1:$i:1} == "w" ]];then {
	((points += wbod))
    } elif [[ ${1:$i:1} == "x" ]];then {
	((points += xbod))
    }	
    fi
  done

    ((body += points)) 
}

ugomod=""$(ls -l skript | awk -F ' ' '{print $1}' | sed 's/\-//' | sed 's/\.//g')""

umod=""${ugomod:0:3}""
gmod=""${ugomod:3:3}""
omod=""${ugomod:6:3}""

echo "user:   $umod"
echo "group:  $gmod"
echo "othoer: $omod"

echo "$list"
pocetprav "$umod"
pocetprav "$gmod"
pocetprav "$omod"
echo "$body"



