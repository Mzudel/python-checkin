# cat vaznost_suboru.sh

#!/usr/bin/env bash
echo "zalomeny \
riadok"

echo "----- seriozna funkcia ----"
# funkcia ktora urcuje vaznost suboru

skore_vaznosti=0

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

    ((skore_vaznosti += points))
}


#echo "user:   $umod"
#echo "group:  $gmod"
#echo "othoer: $omod"





function vaznost_suboru() {
  local nazov_suboru="$1"
  local obsah_suboru="$(cat "$nazov_suboru")"
  echo "$obsah_suboru" | grep -i -e internal -e confidental >/dev/null 2>/dev/null && {
    skore_vaznosti=$(( $skore_vaznosti + 2 ))
  }
  local pocet_riadkov_suboru="$(echo "$obsah_suboru" | wc -l)"
  skore_vaznosti=$(( $skore_vaznosti + ($pocet_riadkov_suboru / 10 ) ))

  ugomod=""$(ls -l $nazov_suboru | awk -F ' ' '{print $1}' | sed 's/\-//' | sed 's/\.//g')""

  umod=""${ugomod:0:3}""
  gmod=""${ugomod:3:3}""
  omod=""${ugomod:6:3}""
  
  pocetprav "$umod"
  pocetprav "$gmod"
  pocetprav "$omod"
  
  local typfile= file $nazov_suboru | awk -F ' ' '{print$2}'

  if [ $typfile == "ASCII" ];then{
    (($skore_vaznosti - 10)) 
  }
  fi


  # output funkcie
  echo "Subor: $nazov_suboru"
  echo "Vaznost: $skore_vaznosti"
}

echo "spustam vaznost suboru s prvym argumentom skriptu"
vaznost_suboru "$1"

# na zaklade pristupovych prav pripocitajte vaznost suboru  (sputitelnost +5 , citanie + 1 , zapisovanie +10 za zvlast za ownera, skupinu, others)


# pouzite prikaz file, ak je obsah suboru ASCII text, odcitajte zo skore 10 bodov.

# pouzite prikaz file, ak je subor binarny, namiesto riadkov pridajte desatinu velkosti suboru v byte-och do skore vaznosti
