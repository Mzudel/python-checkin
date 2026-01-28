#!/bin/bash
set -e
#set -u

#$1 = ${1:-default}
argument=${1:-default}

test "x$argument" == "xhodnota1" && {
  echo "Zadal si argument hodnota1"
  command_ktory_neexistuje || true
  "hodnota1" || true
} || {
  echo "argument bol $argument"
}
echo "$argument"

echo "posledny riadok skriptu"
