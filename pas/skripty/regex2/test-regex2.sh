#!/usr/bin/env bash

cat regex-text

echo "multiple chars via regex"

cat regex | grep [abc] 
cat regex | sed -E "s/[aei]/x/g"

echo "^ reverse match"

cat regex | grep [^abc]

echo "$ je koniec riadku"

cat regex | sed -E "s/$/x/g"

echo "? - element before can occur 0-1"
echo "* - element before can occur 0-n"
echo "+ - element before can occur 1-n"
