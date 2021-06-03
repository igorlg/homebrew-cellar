cask "aws-proton-cli" do
  version "2020-07-20"
  sha256 "cacefe2b23629bde39e89664b10a7d72cb5298edfa05700ffa49438040795fa2"

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
