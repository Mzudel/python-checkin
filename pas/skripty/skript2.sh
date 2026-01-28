#!/usr/bin/env bash
#set -x # debugging mode
#set -e # exit on error
#set -u # exit on undefined variable
#echo $((1+3))

#echo $(( $RANDOM % 5 ))   [0-4]
#echo $((( $RANDOM % 5) +1 )) [1-5]

#command_co_neexistuje - set -e ukonci skript na tomto riadku
#echo"$premenna co neexistuje" #set -u ukonci pri riadku

#float
#echo "5.2 + 4.1" | bc
#echo "posledny riadok skriptu"

# ; je novy riadok
meno="Peter"

if [ "$meno" == "Peter" ]; then  # niekedy treba dat dvojite zatvorky -- [[ podmienka ]]
    # commands if true
	echo "typek neklame"
else
    # commands if false
	echo "typek klame"
elif [ "$meno" == "Jano" ]; then
	echo "sa to je Jano"
else
	echo "Sa to ani Jano ani peto"
fi

