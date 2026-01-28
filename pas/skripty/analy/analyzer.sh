#!/bin/bash
set -eu

file="$(realpath "$1")"
analyzer="$0"

# $# pocet argumentov
test $# -lt 2 && {
	echo "Zadaj minimalne dve argumenty, napr:"
	echo "./analyzer.sh /home/user/file --type=log/csv"
	exit 2
}

# --${3:-}-- kontrola ci 3ti argument existuje a ked nie tak ho nahradi ""
  if [[ ${3:-} == "--debug" ]];then
	set -x
  fi

# -f ci je premmena "$file" existujuci subor
test -f "$file" || {
	echo "Zadaj existujuci subor!!"
  	exit 2
}
echo
echo "Skript: ${analyzer: -11}"
echo "Súbor: $file"
echo

  case "$2" in
  #kontrola jaky je type a ked neni ta exitne a da varovnu spravu
	--type=log)
		#log subor analyza
		# < zober obsah zo suboru
		set +e 
		linec=$(wc -l < $file)
		errorc=$(grep -ci "error" $file)
		warnc=$(grep -ci "warning" $file)
		infoc=$(grep -ci "info" $file)
		set -e
		echo "Počet riadkov $linec"
		echo "ERROR: $errorc"
		echo "WARNING: $warnc"
		echo "INFO: $infoc"		
		
		echo "Rizikové správy $(($errorc + $warnc))"

		if [ $errorc -gt '0' ]; then
		  echo "Chyby nájdené"
		else
		  echo "Bez chýb"
		fi
		
		touch log_report.txt
		echo "Počet riadkov $(wc -l < $file)" > log_report.txt
		echo "ERROR: $errorc" >> log_report.txt
		echo "WARNING: $warnc" >> log_report.txt
		echo "INFO: $infoc" >> log_report.txt
		echo "Výsledok uložený do log_report.txt"

		echo
		echo "prvých 5 riadkov logu:"
		echo 
		head -n 5 $file
		
		echo 
		echo "posledných 5 riadkov logu:"
		echo
		tail -n 5 $file		
		

		;;

	--type=csv)
		#csv subor analyza
		colsum=3
		
		touch csv_clean.txt
		sed 's/ //g' $file > csv_clean.txt	
		linec=$(wc -l < $file)
		echo "Počet Záznamov: $linec"
		
		touch dottable
		echo > dottable
		for row in $file
		do
		  #[a tie znaky] - regex - vsetky znaky ktore su v zatvorkach, backslash na escaping
		  sed 's/[\,\/\;\:\|]/./g' $row >> dottable
		done	

		awk -F '.' '{print $2}' dottable

		touch csv_report.txt
		echo > csv_report.txt
		
		#do sum odloz 3ti prvok, po vsetkych prvkoch videl sum poctom riadkov -1
		awk -F '.' '{ sum += $3 } END { print sum / (NR-1) }' dottable >> csv_report.txt
		echo "Priemerna hodnota v treťom stĺpci: $(awk -F '.' '{ sum += $3 } END { print sum / (NR-2) }' dottable)"
		echo "Spracovaný a uložený do csv_report.txt"
		;;

	*)
		echo "pouzi --type=log alebo --type=csv"
		exit 1
		;;
  esac
exit 0
