cask 'aws-proton-cli' do
  name 'aws-proton-cli'
  version '2020-07-20'
  
  sha256 '356cb52234f54eb017ba99a59eaa74fdfb6b6879a89c36ec2e185413d8b3f362'
  url 'https://github.com/igorlg/homebrew-cellar/blob/master/aws-proton/aws-proton-preview.zip?raw=true'

  depends_on formula: 'awscli'

  model_dir = "#{ENV['HOME']}/.aws/models/proton-preview/#{version}"

  preflight do
    system 'unzip', 'aws-proton-preview.zip'
  end

  installer script: 'install.sh'

  uninstall delete: "#{ENV['HOME']}/.aws/models/proton-preview/"
end

