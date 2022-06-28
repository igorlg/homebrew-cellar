#!/usr/bin/env bash

# -- Formulas
declare -a npm_formulas
npm_formulas[0]="@mhlabs/cwlogs-cli#cwlogs#Formula/cwlogs-cli.rb"
npm_formulas[1]="@mhlabs/evb-cli#evb#Formula/evb-cli.rb"
npm_formulas[2]="@mhlabs/iam-policies-cli#iam-pol#Formula/iam-policies-cli.rb"
npm_formulas[3]="sam-patterns-cli#sam-patterns#Formula/sam-patterns-cli.rb"

for i in "${npm_formulas[@]}"; do
  npmpkg="$(echo $i  | cut -d '#' -f 1)"
  cmd="$(echo $i     | cut -d '#' -f 2)"
  formula="$(echo $i | cut -d '#' -f 3)"

  echo "Updating ${npmpkg} (${formula}). Test cmd: ${cmd}"
  noob $npmpkg \
  | sed "s/raise \"Test.*/system \"#{bin}\/${cmd}\", \"-v\"/g" \
  | tee $formula
done


echo "Getting latest version of aws-session-manager-plugin"
ssm_plugin_latest="$(gh release list -R aws/session-manager-plugin -L 1 | awk '{ print $10 }' | tr -d '()')"
ssm_plugin_current="$(grep '  version' Formula/aws-session-manager-plugin.rb | awk '{ print $2 }' | tr -d '\"')"
if [[ $ssm_plugin_current == $ssm_plugin_latest ]]; then
  echo "Skipping update of session-manager-plugin (Formula/aws-session-manager-plugin.rb)"
  exit 0
fi

echo "Downloading session-manager-plugin v${ssm_plugin_latest} to calculate sha256sum"
wget -q "https://github.com/aws/session-manager-plugin/archive/refs/tags/${ssm_plugin_latest}.zip"
ssm_sha_latest="$(sha256sum ${ssm_plugin_latest}.zip | awk '{ print $1 }')"
ssm_sha_current="$(grep '  sha256' Formula/aws-session-manager-plugin.rb | awk '{ print $2 }' | tr -d '\"')"
rm "${ssm_plugin_latest}.zip"

echo "Updating Formula/aws-session-manager-plugin.rb using MacOS SED"
$sed "s/${ssm_sha_current}/${ssm_sha_latest}/g" Formula/aws-session-manager-plugin.rb
$sed "s/${ssm_plugin_current}/${ssm_plugin_latest}/g" Formula/aws-session-manager-plugin.rb
