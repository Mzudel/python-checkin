#!/usr/bin/env bash

premenna="hodnota1"

function moja_funkcia() {
  echo "toto je moja funkcia"
  echo "prvy argument funkcie je $1"
  local lokalnapremenna= "lokalna_hodnota"
}

moja_funkcia "prvy_argument"
test -z "$prememnna" && {
 echo "premenna 'premenna' nie je definovana" 
}

test -z "$lokalnaprememnna" && {
 echo "premenna 'lokalnapremenna' nie je definovana" 
}






echo "---- seriozna funkcia ----"
#funkcia ktora urcuje vaznost suboru

function vaznost_suboru() {
  local skore_vaznosti
  local nazov_subor="$1"
  local obsah_suboru="$(cat "$nazov_suboru")"
  echo "obsah_suboru" | grep -i -e "internal" -e "confidential" >/dev/null 2>/dev/null && {
    skore_vaznosti=$(( $skore_vaznosti + 2 ))
  }


}

