cask "supershisper" do
  version "1.29.1"
  sha256 "83023dd93120d9f88030c3a49c9067ed841e909e4b9f86a01c46376078f4a65b"

  url "https://builds.superwhisper.com/latest/superwhisper.dmg"
  name "supershisper"
  desc "AU powered voice to text for macOS"
  homepage "https://superwhisper.com/"

  auto_updates true

  app "superwhisper.app"

  zap trash: [
    "~/Documents/superwhisper",
    "~/Library/Application Support/superwhisper",
  ]


end
