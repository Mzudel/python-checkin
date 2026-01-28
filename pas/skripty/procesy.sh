#!/usr/bin/env/ bash


sleep 5 &

echo "last process id is $!"

ps -ef | grep "$!" | grep -v grep

#exit code procesov
#0 - ok "vrati True, prikaz je uspesny"
#cokolvek okrem 0 (najcastejsie 1) "vrati False, prikaz zlyhal"
echo "vypisonvaie exit codu posledneho procesu"
echo "$?" # 0, vysledok predosleho echa


# porovname ci 5=6
# ak je exit code command test 0 (ak vysledok podmienky je pravdivy), spusti sa &&
# ak je exit code command test 1,2,3,... (ak vysledok podmienky je nepravdivy),
#spusti sa ||

test 5 -eq 6 && {echo "$?"} || {echo "$?}

test5 5 -eq 6
