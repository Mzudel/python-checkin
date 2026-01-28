#!/usr/bin/env bash

pole=(jablko hruska slivka)

#volanie nteho elementu pola
echo "${pole[0]}"

#vypis celeho pola
echo "${pole[@]}"

#echo "${pole[*]}"

#zadefinovanie hodnoty na indexe x
pole[3]="surprise"

echo "${pole[@]}"

#vypis velkosti
echo "${#pole[@]}"

new_element="${#pole[@]}"
pole[$new_elements]="ananas"

echo "${pole[@]}"

pole+=("dalsi")


echo "${pole[@]}"
