cask "aws-proton-cli" do
  version "2020-07-20"
  sha256 "356cb52234f54eb017ba99a59eaa74fdfb6b6879a89c36ec2e185413d8b3f362"

  url "https://github.com/igorlg/homebrew-cellar/blob/master/aws-proton/aws-proton-preview.zip?raw=true"
  name "aws-proton-cli"

  depends_on formula: "awscli"

  model_dir = "#{ENV["HOME"]}/.aws/models/proton-preview/#{version}"

  installer script: "install.sh"

  preflight do
    system "unzip", "aws-proton-preview.zip"
  end

  uninstall delete: "#{ENV["HOME"]}/.aws/models/proton-preview/"
end
