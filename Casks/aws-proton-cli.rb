cask "aws-proton-cli" do
  version "2020-07-20"
  sha256 "a834f7ef6e86ad531c15ca707aab1eb5d74a2760a49fb9c70b377b441c7068b7"

  url "https://github.com/igorlg/homebrew-cellar/blob/master/aws-proton/aws-proton-preview.zip?raw=true"
  name "aws-proton-cli"

  depends_on formula: "awscli"

  installer script: "install.sh"

  # preflight do
  #   system "unzip", "aws-proton-preview.zip"
  # end

  uninstall delete: "#{ENV["HOME"]}/.aws/models/proton-preview/"
end
