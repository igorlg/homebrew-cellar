cask "aws-proton-cli" do
  version "2020-07-20"
  sha256 "e62937890343b1ce845a9096a3de9d0b2741897f121cf0a2f73871097f60006e"

  url "https://github.com/igorlg/homebrew-cellar/blob/master/aws-proton/aws-proton-preview.zip?raw=true"
  name "aws-proton-cli"

  depends_on formula: "awscli"

  installer script: "install.sh"

  # preflight do
  #   system "unzip", "aws-proton-preview.zip"
  # end

  uninstall delete: "#{ENV["HOME"]}/.aws/models/proton-preview/"
end
