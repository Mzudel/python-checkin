#!/usr/bin/env bash
set -e
set -u
#set -x 
#aktualna_cesta=$(pwd)

pociatoc_cesta="$PWD"

echo "pwd = $pociatoc_cesta"

mojacesta="$(realpath "$0")"
mojpriecinok="$(dirname "$mojacesta")"

cd "$mojpriecinok"

test -d lib && {
  source lib/* || {
    echo "warning folder lib not loaded!"
}
} || {
  echo "warning: folder lib not loaded!"
}

command -v vaznost_suboru 2>/dev/null >/dev/null && {
  echo "prikaz vaznost_suboru existuje"
}

calc_chars "123456"


