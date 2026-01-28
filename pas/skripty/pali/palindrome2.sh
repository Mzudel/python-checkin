#!/usr/bin/env bash

#vytvorim kopiu slova otocim ju a porovnam

#input 2 sposoby
#1.sposob(pochopitelnejsi)
read -p "zadaj slovo:" slovo

#2. sposob(menej cpu)
#slovo="$1"

#pocet pismen v slove 2 sposoby

pocet_pismen="$(echo -n "$slovo" | wc -m)"
#pocet_pismen="${#slovo}"

#parny pocet 

if [ $(("$pocet_pismen" % 2 == 0)) ]
  then 
    parny_pocet=true
  else
    parny_pocet=false  
fi

if [ $parny_pocet == "true" ]
  then{
    polznakov= $((pocet_pismen / 2))
    pr_polovica=${slovo::polznakov}
    dr_polovica=${slovo::-polznakov}
  echo "prva polovica $pr_polovica $dr_polovica"
  }else{
    :}
fi

