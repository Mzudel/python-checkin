#!/usr/bin/env bash
#set -x
echo menu

name="$0"
sname="${name:2}"
mydir="$(pwd)"
volba=0
ip4="$"
command=""

clear

while [ "$volba" -ne "5" ]
do
  echo "1-vypis meno, aktualnu cestu uzivatela"
  echo "2-vypis ipv4 IP adresy"
  echo "3-vypis nazov a verziu linuxovej distribucie"
  echo "4-vykonaj prikaz(zadaj prikaz a ten sa spusti)"
  echo "5-exit"

  read -p "Zadaj volbu: " volba

  case "$volba" in
	'1')
	  clear
	  echo "$(whoami), $mydir"
  	  ;;
	'2')
	  clear
	  #ifconfig -||-
	  ip a | grep "inet " | awk '{print $2}'
  	  ;;
	'3')
	  clear
	  cat /etc/os-release | grep -m 1 -e 'NAME' | awk -F '"' '{print $2}'
	  cat /etc/os-release | grep -m 1 -i 'version' | awk -F '"' '{print $2}'
  	  ;;
	'4')
	  clear
	  read -p "Napis prikaz: " command
	  $command
  	  ;;
	'5')
	  clear
	  #exit 0
	  echo "exiting..."
  	  ;;
	*)
	  clear
	  echo "napis cislo od 1 do 5 		hint(1, 2, 3, 4, 5)"
  	  ;;



  esac

done
