#! /usr/bin/env bash
#test je to iste ako [


test "$var" == "Peter" && {
  echo "Šak to je Peťo!" || true #zlyhanie na tomto riadku spustilo else preto || ture
} || { echo "Ty nie si Peter!" }

test -z "var" && echo "var is empty"
test -n "var" && echo "var is not empty"

test -f "/home/subor1" || echo "subor /home/subor1 neexistuje"
