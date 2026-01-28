#!/usr/bin/env bash

test -f text || {
  echo "file text nof found, exitting..."
  exit 0
}

input="$(cat text)"
echo "zmena malych pismen na velke"
echo "$input" | tr "[:lower:]" "[:upper:]"
echo

echo "zmena medzier a enterov na _"
echo "$input" | tr "[:space:]" "_"
echo

echo "anonymizacia hardcoded"
echo "$input" | sed 's/student a ma [[:digit:]]/*/g'

echo "anonymizacia "
echo "$input" | sed 's/student......[[:digit:]]/*/g'
