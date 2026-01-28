
echo "---- seriozna \
funkcia ----"
#funkcia ktora urcuje vaznost suboru

function vaznost_suboru() {
  local skore_vaznosti
  local nazov_suboru="$1"
  local obsah_suboru="$(cat "$nazov_suboru")"
  echo "obsah_suboru" | grep -i -e "internal" -e "confidential" >/dev/null 2>/dev/null && {
    skore_vaznosti=$(( $skore_vaznosti + 2 ))
  }
  local pocet_riadkov= "$(echo "obsah_suboru" | wc -l)"
  skore_vaznosti= $($skore_vaznosti + ($pocet_riadkov / 10))
  #output funkcie
  echo "Subor: $nazov_suboru"
  echo "vaznost: $skore_vaznosti"
}

echo "spustam vaznost suboru s prvym argumentom skriptu"
