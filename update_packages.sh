#!/usr/bin/env bash

# -- Formulas
declare -a npm_formulas
npm_formulas[0]="@mhlabs/cwlogs-cli#cwlogs#Formula/cwlogs-cli.rb"
npm_formulas[1]="@mhlabs/evb-cli#evb#Formula/evb-cli.rb"
npm_formulas[2]="@mhlabs/iam-policies-cli#iam-pol#Formula/iam-policies-cli.rb"
npm_formulas[3]="sam-patterns-cli#sam-patterns#Formula/samp-cli.rb"

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


echo "Getting latest version of aws-session-manager-plugin"
ssm_plugin_latest="$(gh release list -R aws/session-manager-plugin -L 1 | awk '{ print $10 }' | tr -d '()')"
ssm_plugin_current="$(grep '  version' Formula/aws-session-manager-plugin.rb | awk '{ print $2 }' | tr -d '\"')"
if [[ $ssm_plugin_current == $ssm_plugin_latest ]]; then
  echo "Skipping update of session-manager-plugin (Formula/aws-session-manager-plugin.rb)"
  exit 0
fi

formula="Formula/aws-session-manager-plugin.rb"
echo "Downloading session-manager-plugin v${ssm_plugin_latest} to calculate sha256sum"
wget -q "https://s3.amazonaws.com/session-manager-downloads/plugin/${ssm_plugin_latest}/mac/sessionmanager-bundle.zip"

ssm_sha_latest="$(sha256sum sessionmanager-bundle.zip | awk '{ print $1 }')"
ssm_sha_current="$(grep '  sha256' $formula | awk '{ print $2 }' | tr -d '\"')"

rm "sessionmanager-bundle.zip"

echo "[aws-session-manager-plugin] ssm_sha_latest:  ${ssm_sha_latest}"
echo "[aws-session-manager-plugin] ssm_sha_current: ${ssm_sha_current}"

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Updating $formula using MacOS SED"
  sed -i '' "s/${ssm_sha_current}/${ssm_sha_latest}/g" $formula
  sed -i '' "s/${ssm_plugin_current}/${ssm_plugin_latest}/g" $formula
else
  echo "Updating $formula using Linux SED"
  sed -i "s/${ssm_sha_current}/${ssm_sha_latest}/g" $formula
  sed -i "s/${ssm_plugin_current}/${ssm_plugin_latest}/g" $formula
fi
