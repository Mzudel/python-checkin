#!/usr/bin/env bash
set -e

tmpdir="$(mktemp -d tmp.dir.XXXXXX)"
tmpfile_raw="$(mktemp "$tmpdir/tmpfile.XXXXXX")"

function upratovanie() {
  rm -rf "$tmpdir"
}

trap upratovanie EXIT
trap upratovanie ERR

mojacesta="$(realpath "$0")"
#echo "$mojacesta"
mojpriec="$(dirname "$mojacesta")"
#echo "$mojpriec"
cd "$mojpriec"
#pwd

#input_content="$(cat temp_template.txt)"


#echo "$input_content" > "$(tmpfile_raw)"
cat temp_template.txt > "$tmpfile_raw"

cat "$tmpfile_raw" | awk '{print $1}'

#comand_k

#rm -rf "$tmpdir"

