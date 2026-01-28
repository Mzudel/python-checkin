#!/usr/bin/env bash

# rozdelim slovo na polovicu, druhu otocim, a porovnam

#input 2 sposoby
#1. sposob (pochopitelnejsi):

slovo=''

read -r -p "zadaj slovo:" slovo

##2. sposob (menej CPU):
##slovo="$1"

#pocet pismen v slove 2.sposoby

#pocet_pismen="$(echo -n "$slovo" | wc --chars)"

pocet_pismen="${#slovo}"

#parny pocet ? 2 moznosti

#if [ $(( "$pocet_pismen" % 2 )) == 0 ]
#then
#  parny_pocet=true
#else
#  parny_pocet=false
#fi

#predelenie_dvomi="$(echo "scale=2; 9 / 2" | bc | awk -F'.' '{print $2}')"
#test "$predelenie_dvomi" -gt 0 && parny_pocet=true


obratene_slovo=""

while read i; do
	obratene_slovo="$obratene_slovo${slovo:$i:1}"
done < <(seq $((pocet_pismen-1)) -1 0)

echo "$obratene_slovo"

echo -n "Slovo ${slovo} "
if [ $slovo == $obratene_slovo ]; then
	echo "je palindrom"
else
	echo "nie je palindrom"
fi	
