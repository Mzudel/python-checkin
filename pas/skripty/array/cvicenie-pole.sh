#!/usr/bin/env bash

#zistite vsetkych lokalych userov a vloz ich do pola users
#etc/passwd /etc/shadow

#vytvorte subor s 2 stlpcami kde 1 stlpec meno uzivatela a 2 stlpec je id
	# id meno
tmpfile="$(mktemp tmpfile.XXXXXX)"
pole=()
cat /etc/passwd | awk -F ':' '{print $1}' > $tmpfile

for name in tmpfile;
  do
    pole+= $name
  done

echo "${pole[@]}"
