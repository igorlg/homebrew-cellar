#!/usr/bin/env bash

# -- Formulas
declare -a npm_formulas
npm_formulas[0]="@mhlabs/cwlogs-cli#cwlogs#Formula/cwlogs-cli.rb"
npm_formulas[1]="@mhlabs/evb-cli#evb#Formula/evb-cli.rb"
npm_formulas[2]="@mhlabs/iam-policies-cli#iam-pol#Formula/iam-policies-cli.rb"
npm_formulas[3]="samp-cli#samp#Formula/samp-cli.rb"

for i in "${npm_formulas[@]}"; do
  npmpkg="$(echo $i  | cut -d '#' -f 1)"
  cmd="$(echo $i     | cut -d '#' -f 2)"
  formula="$(echo $i | cut -d '#' -f 3)"

  echo "Updating ${npmpkg} (${formula}). Test cmd: ${cmd}"
  noob $npmpkg \
  | sed "s/raise \"Test.*/system \"#{bin}\/${cmd}\", \"-v\"/g" \
  | sed "s/class Mhlabs/class /g" \
  | tee $formula
done
