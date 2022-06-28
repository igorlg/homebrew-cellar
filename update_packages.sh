#!/usr/bin/env zsh

# -- Formulas
echo "Updating @mhlabs/cwlogs-cli (Formula/cwlogs-cli.rb)"
noob @mhlabs/cwlogs-cli       | tee Formula/cwlogs-cli.rb
echo "Updating @mhlabs/evb-cli (Formula/evb-cli.rb)"
noob @mhlabs/evb-cli          | tee Formula/evb-cli.rb
echo "Updating @mhlabs/iam-policies-cli (Formula/iam-policies-cli.rb)"
noob @mhlabs/iam-policies-cli | tee Formula/iam-policies-cli.rb
echo "Updating sam-patterns-cli (Formula/sam-patterns-cli.rb)"
noob sam-patterns-cli         | tee Formula/sam-patterns-cli.rb

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

sed -i '' "s/${ssm_sha_current}/${ssm_sha_latest}/g" Formula/aws-session-manager-plugin.rb
sed -i '' "s/${ssm_plugin_current}/${ssm_plugin_latest}/g" Formula/aws-session-manager-plugin.rb

# echo "ssm_plugin_latest:  ${ssm_plugin_latest}"
# echo "ssm_plugin_current: ${ssm_plugin_current}"
# echo "ssm_sha_current:    ${ssm_sha_current}"
# echo "ssm_sha_latest:     ${ssm_sha_latest}"

# -- Casks
