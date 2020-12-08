cask 'aws-proton-cli' do
  name 'aws-proton-cli'
  version '2020-07-20'
  
  sha256 '1893b9f093197e00bb29ff8c05be3fd36e30d37dde6a6988f0c80bdcb02a868c'
  url 'https://github.com/igorlg/homebrew-cellar/blob/master/aws-proton/aws-proton-preview.zip?raw=true'

  depends_on formula: 'awscli'

  model_dir = "#{ENV['HOME']}/.aws/models/proton-preview/#{version}"

  preflight do
    system 'unzip', 'aws-proton-preview.zip'
  end

  installer script: 'install.sh'

  uninstall delete: "#{ENV['HOME']}/.aws/models/proton-preview/"
end

